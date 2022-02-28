import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';


class OrderState extends StatefulWidget {
  int id;
  String state;
  String date;
   OrderState({Key? key,
     required this.id,
     required this.state,
     required this.date
   }) : super(key: key);

  @override
  _OrderStateState createState() => _OrderStateState();
}

class _OrderStateState extends State<OrderState> {




  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 25.h,),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(


                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 4.w
                        ),
                        child: Text('كل الطلبات',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: LightThemeColors.darkBackgroundColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 4.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 12.w),
                    child: Container(


                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 4.w
                        ),
                        child: Text('يمكن متابعة الطلب وحالة الطلب',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: LightThemeColors.lightGreyShade400,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(12),
                      color: LightThemeColors.darkBackgroundColor
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('رقم الطلب'+'  '+widget.id.toString(),
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: LightThemeColors.backgroundColor,
                            fontFamily: "Nahdi",
                            fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w,),
                  SvgPicture.asset("assets/icons/clone.svg",
                    height: 35.h,
                    color: LightThemeColors.darkBackgroundColor,
                  )

                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/clock.svg',
                    width: 15.w,
                  ),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: Container(


                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 4.w
                        ),
                        child: Text('تاريخ الطلب'+'   '+widget.date,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: LightThemeColors.lightGreyShade400,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),

                ],
              ),

              SizedBox(height: 20.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/circle.svg',
                     width: 25.w,
                    ),
                    Expanded(
                      child: Divider(
                        color: LightThemeColors.lightGreyShade400,
                      ),
                    ),
                    SvgPicture.asset('assets/icons/circle.svg',
                      width: 25.w,
                    ),
                    Expanded(
                      child: Divider(
                        color: LightThemeColors.lightGreyShade400,
                      ),
                    ),
                    SvgPicture.asset('assets/icons/circle.svg',
                      width: 25.w,
                      color: LightThemeColors.lightGreyShade400,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [


                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 2.w),
                    child: Container(


                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 4.w
                        ),
                        child: Text(widget.state,
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: LightThemeColors.lightGreyShade400,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20.h,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: LightThemeColors.darkBackgroundColor,
                onPressed: (){
                  Navigator.pop(context);
                },

                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 85.w,
                      vertical: 8.h
                  ),
                  child: Text('طلباتي',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: LightThemeColors.backgroundColor,
                        fontFamily: "Nahdi",
                        fontWeight: FontWeight.w900
                    ),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

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
