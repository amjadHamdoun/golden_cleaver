import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:ui' as ui;
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/category/model/product_model.dart';
import 'package:golden_cleaver/features/Screen/item/item_details_with_size.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';

class Sizes extends StatefulWidget {
  ProductModel product;
  PagesBloc bloc;
  Sizes({Key? key,
    required this.product,
    required this.bloc
  }) : super(key: key);

  @override
  _SizesState createState() => _SizesState();
}

class _SizesState extends State<Sizes> {


  @override
  void initState() {

    super.initState();
  }


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

              // SizedBox(height: 10.h,),
              //
              // Row(
              //   children: [
              //
              //     Expanded(
              //       flex: 2,
              //       child: Container(
              //         decoration: BoxDecoration(
              //             border: Border(
              //                 bottom: BorderSide(
              //                   color:
              //                   LightThemeColors.darkBackgroundColor,
              //                 )
              //             )
              //         ),
              //         child: Padding(
              //           padding:  EdgeInsets.symmetric(
              //               vertical: 8.h
              //           ),
              //           child: Text(' الاحجام ضمن '+' '+widget.product.name!,
              //             style: TextStyle(
              //                 fontSize: 16.sp,
              //                 color: LightThemeColors.darkBackgroundColor,
              //                 fontFamily: "Nahdi",
              //                 fontWeight: FontWeight.w900
              //             ),
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //       ),
              //     ),
              //
              //     Expanded(
              //       child: SizedBox(),
              //     ),
              //
              //   ],
              // ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.8,

                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: widget.product.sizes.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(

                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>
                                  ItemDetailsWithSizes(
                                    productModel: widget.product,
                                    sizeModel: widget.product.sizes[index],
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
                            width: 0.35.sw,

                            child: CachedNetworkImage(
                              imageUrl:widget.product.sizes[index].image!,
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,

                                  )
                                ),
                              ),
                              placeholder: (context, url) => Center(child: Center(child: CircularProgressIndicator())),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),

                          ),
                              SizedBox(height: 5.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                                    child: Container(

                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Color(0xffEAA947
                                            ),),
                                          borderRadius: BorderRadius.circular(7)),
                                      child: Padding(
                                        padding:  EdgeInsets.only(bottom: 3.h,right: 40.w,
                                            top: 4.h,left: 40.w
                                        ),
                                        child: Text(widget.product.sizes[index].price.toString()+"  "+'ر.س',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              color: LightThemeColors.darkBackgroundColor,
                                              fontFamily: "Nahdi",
                                              fontWeight: FontWeight.w900
                                          ),
                                          textDirection: ui.TextDirection.rtl,
                                          textAlign: TextAlign.start,

                                        ),
                                      ),
                                    ),
                                  ),

                                ],
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
                                        ItemDetailsWithSizes(
                                          productModel: widget.product,
                                          sizeModel: widget.product.sizes[index],
                                          bloc: widget.bloc,
                                        )),
                                  );
                                },

                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(widget.product.sizes[index].name!,
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
