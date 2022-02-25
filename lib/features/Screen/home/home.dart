
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/item/item_details.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';
import 'package:golden_cleaver/features/Screen/products/products.dart';
import 'package:golden_cleaver/features/Screen/sub_category/sub_category.dart';

class Home extends StatefulWidget {
  PagesBloc bloc;

  VoidCallback press;
  
   Home({Key? key,required this.bloc
     ,
     required this.press

   }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin{

  int select=0;
  @override
  void initState() {
    widget.bloc.onGetSlidersEvent();
  //  widget.bloc.onGetProductsEvent();
    widget.bloc.onGetCategoriesEvent(true);

    super.initState();
  }


  @override

  Widget build(context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            widget.bloc.onGetSlidersEvent();
            widget.bloc.onGetCategoriesEvent(true);
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BlocConsumer<PagesBloc, PagesState>(
              bloc: widget.bloc,
              listener: (context, state) {

                if(state.errorMessage!.length>0)
                  {
                    Fluttertoast.showToast(
                        msg: state.errorMessage!,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: LightThemeColors.lightGreyShade400,
                        textColor: LightThemeColors.backgroundColor,
                        fontSize: 15.0.sp
                    );
                  }
              },
              builder: (context, state) {


                return Column(
                  children: [
                    SizedBox(height: 20.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' غولدن كليفر',
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: LightThemeColors.primaryColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h,),
                    if(state.isLoadingSlider!)
                      SizedBox(
                        height: 0.8.sh,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )else
                    if(state.isSuccessSlider!)
                    Column(
                      children: [
                        if(state.sliderModel!.data!.length>0)
                        CarouselSlider.builder(
                          itemCount:state.sliderModel!.data!.length,
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>

                          CachedNetworkImage(

                            imageUrl: state.sliderModel!.data![itemIndex].slider_image.toString(),
                            imageBuilder: (context, imageProvider) => Container(


                              decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: imageProvider,
                                    fit: BoxFit.fill,
                                  )
                              ),
                            ),
                            placeholder: (context, url) => Center(child: Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),

                          options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.9,
                          aspectRatio: 2.0,
                          initialPage: 2,
                        ),
                        ),
                        SizedBox(height: 10.h,),
                        if(state.categoryModel!.data!.length>0)
                        Row(
                          children: [


                            for(int i=0; i<state.categoryModel!.data!.length;i++)
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  select=i;
                                  setState(() {

                                  });



                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color:select==i?
                                              LightThemeColors.primaryColor:
                                              LightThemeColors.lightGreyShade400
                                          )
                                      )
                                  ),
                                  child: Padding(
                                    padding:  EdgeInsets.symmetric(
                                        vertical: 8.h
                                    ),
                                    child: Text(state.categoryModel!.data![i].name!,
                                      style: TextStyle(
                                          fontSize: 15.sp,

                                          color:select==i?
                                          LightThemeColors.primaryColor:
                                          LightThemeColors.lightGreyShade400,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),

                        if(state.categoryModel!.data!.length>0)
                        Column(
                          children: [

                            SizedBox(height: 10.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 12.w),
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      childAspectRatio: 1,

                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20),
                                  itemCount: state.categoryModel!.data![select].sub_categories!.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      alignment: Alignment.center,
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>
                                                Products(
                                                  subCategory: state.categoryModel!.data![select].sub_categories![index],
                                                  bloc: widget.bloc,

                                                )),
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            if(state.categoryModel!.data![select].sub_categories![index]!=null)
                                            CachedNetworkImage( imageUrl: state.categoryModel!.data![select].sub_categories![index].image!,
                                              height: 100.h,
                                              width: 0.33.sw,
                                              fit: BoxFit.fill,
                                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                              errorWidget: (context, url, error) => Icon(Icons.error_outline,
                                              size: 32.w,
                                              ),

                                            )else
                                              Image.asset('assets/images/splash1.png', height: 100.h,

                                                fit: BoxFit.fill,

                                              ),



                                            SizedBox(height: 5.h,),
                                            MaterialButton(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10)),
                                              color: LightThemeColors.darkBackgroundColor,
                                              onPressed: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) =>
                                                      Products(
                                                        subCategory: state.categoryModel!.data![select].sub_categories![index],
                                                        bloc: widget.bloc,

                                                      )),
                                                );
                                              },

                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(state.categoryModel!.data![select].sub_categories![index].name!,
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: LightThemeColors.goldenColor,
                                                          fontFamily: "Nahdi",
                                                          fontWeight: FontWeight.w900
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),


                                                ],
                                              ),

                                            ),
                                          ],
                                        ),
                                      ),

                                    );
                                  }),
                            ),
                          ],
                        ),

                      ],
                    )else
                    if(!state.isSuccessSlider!&&state.errorMessage!.length>0)
                      Container(
                        height: 0.8.sh,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/oops.svg',
                            width: 92.w,
                            color: LightThemeColors.darkBackgroundColor,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(state.errorMessage!,
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: LightThemeColors.primaryColor,
                                      fontFamily: "Nahdi",
                                      fontWeight: FontWeight.w900
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),

                    SizedBox(height: 30.h,),

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
