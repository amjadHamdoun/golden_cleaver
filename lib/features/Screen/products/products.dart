import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/category/model/sub_category_model.dart';
import 'package:golden_cleaver/features/Screen/item/item_details_from_category.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/sizes/sizes.dart';

class Products extends StatefulWidget {
  SubCategoryModel subCategory;
  PagesBloc bloc;
  Products({Key? key,
    required this.subCategory,
    required this.bloc
  }) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {




  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: LightThemeColors.darkBackgroundColor,
                        size: 22.w,
                      ),
                    ),
                    Text(' غولدن كليفر',
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: LightThemeColors.primaryColor,
                          fontFamily: "Nahdi",
                          fontWeight: FontWeight.w900
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: ScreenUtil().screenWidth,
                child: Divider(
                  thickness: 1,
                  color: LightThemeColors.lightGreyShade400,
                ),
              ),

              SizedBox(height: 10.h,),

              Row(
                children: [

                  Expanded(
                    flex: 2,
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
                        child: Text('المنتجات ضمن '+' '+widget.subCategory.name!,
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
                    itemCount: widget.subCategory.products!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(

                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  Sizes(
                                    product:  widget.subCategory.products![index],
                                    bloc: widget.bloc,
                                  )),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                            Container(
                            height: 100.h,

                            child: CachedNetworkImage(
                              imageUrl:widget.subCategory.products![index].image!,
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider
                                  )
                                ),
                              ),
                              placeholder: (context, url) => Center(child: Center(child: CircularProgressIndicator())),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),

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
                                        Sizes(
                                          product: widget.subCategory.products![index],
                                          bloc: widget.bloc,
                                        )),
                                  );
                                },

                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(widget.subCategory.products![index].name!,
                                        style: TextStyle(
                                            fontSize: 16.sp,
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
              SizedBox(height: 30.h,),

            ],
          ),
        ),
      ),
    );
  }


}
