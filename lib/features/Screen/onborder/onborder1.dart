import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_cleaver/Preference.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/mainlog/mainlogscreen.dart';

class OnBorder1 extends StatefulWidget {
  final int currentIndex;

  const OnBorder1(this.currentIndex, {Key? key}) : super(key: key);

  @override
  _OnBorder1State createState() => _OnBorder1State();
}

class _OnBorder1State extends State<OnBorder1> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: LightThemeColors.secondColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)));

    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(height:0.37.sh ,width: 0.85.sw,
                            child:
                                Image.asset("assets/images/onborder1.2.png",fit: BoxFit.fill,)),
                        Padding(
                          padding: EdgeInsets.only(left: 18.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.h,
                              ),
                              Container(
                                  height:0.32.sh ,width: 0.85.sw,
                                  child: Image.asset(
                                      "assets/images/onborder1.1.png")),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 100.w,child: Image.asset("assets/images/onborder1.3.png")),
                      ],
                    ),
                    Text(
                      "توفير جميع انواع اللحوم الطازجة",
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: LightThemeColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "جميع اللحوم الطازجة يوميا",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: LightThemeColors.primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                    Text(
                      "اترك الاختيار لنا وتمتع بالطعم",
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: LightThemeColors.primaryColor,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildCircle(widget.currentIndex == 0
                            ? Colors.amber
                            : LightThemeColors.lightGreyShade400),
                        SizedBox(
                          width: 8.w,
                        ),
                        buildCircle(widget.currentIndex == 3
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
                      height: 40.h,
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
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
