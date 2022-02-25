import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/Preference.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/mainlog/mainlogscreen.dart';

class OnBorder2 extends StatefulWidget {
  final int currentIndex;

  const OnBorder2(this.currentIndex, {Key? key}) : super(key: key);

  @override
  _OnBorder2State createState() => _OnBorder2State();
}

class _OnBorder2State extends State<OnBorder2> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: LightThemeColors.secondColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)));

    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.50.sh,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20.w,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              height: 0.35.sh,
                              width: 0.80.sw,
                              child: Image.asset(
                                "assets/images/onborder2.2.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [ SizedBox(width: 20.w,),
                        Column(
                          children: [
                            SizedBox(
                                height: 0.35.sh,
                                width: 0.80.sw,
                                child: SvgPicture.asset("assets/images/hazira.svg",fit: BoxFit.fill,))
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 160.h,
                        ),
                        Stack(

                          children: [
                            Row(
                              children: [SizedBox(width: 100.w,),
                                SizedBox(height: 180.h,width: 180.w,
                                  child: Image.asset(
                                    "assets/images/onborder2.3.png",fit: BoxFit.fill,

                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [SizedBox(width: 70.w,),
                                SizedBox(height: 140.h,width: 140.w,
                                  child: Image.asset(
                                    "assets/images/onborder2.3.png",fit: BoxFit.fill,

                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 90.h,left: 50.w),
                              child: Row(
                                children: [

                                  SizedBox(
                                    width: 140.w,
                                  ),
                                  SizedBox(width: 90.w,
                                    child: Image.asset(
                                      "assets/images/onborder2.4.png",fit: BoxFit.fill,

                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              Text(
                "جميع الذبائح المقدمة من",
                style: TextStyle(
                    fontSize: 21.sp,
                    color: LightThemeColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "حظيرة الورود",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: LightThemeColors.primaryColor,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "أجود انواع نقوم بدبحها يوميا",
                style: TextStyle(
                    fontSize: 19.sp,
                    color: LightThemeColors.primaryColor,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildCircle(widget.currentIndex == 3
                      ? Colors.amber
                      : LightThemeColors.lightGreyShade400),
                  SizedBox(
                    width: 8.w,
                  ),
                  buildCircle(widget.currentIndex == 1
                      ? Colors.amber
                      : LightThemeColors.lightGreyShade400),
                  SizedBox(
                    width: 8.w,
                  ),
                  buildCircle(widget.currentIndex == 3
                      ? Colors.amber
                      : LightThemeColors.lightGreyShade400),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 140.w,
                height: 45.h,
                child: ElevatedButton(
                    onPressed: () {
                      Preferences.saveIsFirstTime(false);
                      Route route = MaterialPageRoute(builder: (context) => MainLog());
                      Navigator.pushReplacement(context, route);
                    },
                    child: Text(
                      "تخطي",
                      style: TextStyle(fontSize: 18.sp,color: LightThemeColors.backgroundColor),
                    ),
                    style: style),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Container buildCircle(Color color) {
    return Container(
      height: 8.h,
      width: 8.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(90), color: color),
    );
  }
}
