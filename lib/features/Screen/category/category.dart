import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';
import 'package:golden_cleaver/features/Screen/sub_category/sub_category.dart';

class Category extends StatefulWidget {
  PagesBloc bloc;
  Category({Key? key,required this.bloc}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
   widget.bloc.onGetCategoriesEvent(false);
    super.initState();
  }



  @override

  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            widget.bloc.onGetCategoriesEvent(true);

          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BlocConsumer<PagesBloc, PagesState>(
              bloc: widget.bloc,
              listener: (context, state) {

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
                              fontSize: 22.sp,
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
                      if(state.isSuccessSlider!)Column(
                      children: [
                        Row(
                          children: [

                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                          color:
                                          LightThemeColors.darkBackgroundColor,
                                        )
                                    )
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(
                                      vertical: 8.h
                                  ),
                                  child: Text('الاقسام',
                                    style: TextStyle(
                                        fontSize: 16.sp,

                                        color:
                                        LightThemeColors.darkBackgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),

                          ],
                        ),
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
                              itemCount: state.categoryModel!.data!.length,
                              itemBuilder: (BuildContext ctx, index) {
                                return Container(

                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SubCategory(
                                          cate: state.categoryModel!.data![index],
                                          bloc: widget.bloc,
                                        )),
                                      );
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CachedNetworkImage(
                                          imageUrl:state.categoryModel!.data![index].image!,
                                          fit: BoxFit.cover,
                                          imageBuilder: (context, imageProvider) => Container(
                                            height: 100.h,
                                              width: 100.h,

                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill,
                                                )


                                              ),
                                          ),
                                          placeholder: (context, url) => Center(child: Center(child: CircularProgressIndicator())),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                        SizedBox(height: 5.h,),
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color(0xffEAA947
                                                ),),
                                              borderRadius: BorderRadius.circular(7)),
                                          child: Padding(
                                            padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                                ,horizontal: 4.w
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Text(state.categoryModel!.data![index].name!,
                                                    style: TextStyle(
                                                        fontSize: 13.sp,
                                                        color: LightThemeColors.darkBackgroundColor,
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
                                        ),

                                      ],
                                    ),
                                  ),

                                );
                              }),
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
