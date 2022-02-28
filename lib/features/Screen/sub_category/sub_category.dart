import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/category/model/data.dart';
import 'package:golden_cleaver/features/Screen/item/item_details.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'package:golden_cleaver/features/Screen/products/products.dart';

class SubCategory extends StatefulWidget {
  Data cate;
  PagesBloc bloc;
  SubCategory({Key? key,
    required this.cate,
    required this.bloc
  }) : super(key: key);

  @override
  _SubCategoryState createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {




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
                        child: Text('الاقسام الفرعية ضمن'+' ' +widget.cate.name!,
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
                    itemCount: widget.cate.sub_categories!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(

                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  Products(
                                subCategory:
                                widget.cate.sub_categories![index],
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
                                width: 100.h,
                                child: CachedNetworkImage(
                                  imageUrl:widget.cate.sub_categories![index].image!,
                                  imageBuilder: (context, imageProvider) => Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.fill,
                                      )


                                    ),
                                  ),
                                  placeholder: (context, url) => Center(child: Center(child: CircularProgressIndicator())),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),

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
                                        child: Text(widget.cate.sub_categories![index].name!,
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
              SizedBox(height: 30.h,),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(

          showUnselectedLabels: true,
          onTap: (int index) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Pages(
                      restCart: false,
                      pageNumber: index,
                    ),
              ),
                  (route) => false,
            );
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/house-damage.svg',
                  color:
                  LightThemeColors.lightGreyShade400,
                ),
                title: Text('الرئيسية',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),

            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset('assets/icons/dice.svg',
            //       color: select == 1 ? LightThemeColors.primaryColor :
            //       LightThemeColors.lightGreyShade400,
            //     ),
            //     title: Text('الاقسام',
            //       style: TextStyle(
            //         fontSize: 15.sp,
            //         color: select == 1 ? LightThemeColors.primaryColor :
            //         LightThemeColors.lightGreyShade400,
            //       ),
            //     )
            //
            // ),

            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/copy.svg',
                  color:
                  LightThemeColors.lightGreyShade400,
                ),
                title: Text('طلباتي',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),
            BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset('assets/icons/shopping-basket.svg',
                      color:
                      LightThemeColors.lightGreyShade400,
                    ),

                  ],
                ),
                title: Text('السلة',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/user-circle.svg',
                  color:
                  LightThemeColors.lightGreyShade400,
                ),
                title: Text('حسابي',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),
          ],
        ),
      ),
    );
  }


}
