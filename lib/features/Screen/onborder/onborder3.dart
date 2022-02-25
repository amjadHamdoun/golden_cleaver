import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:golden_cleaver/Preference.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/mainlog/mainlogscreen.dart';

class OnBorder3 extends StatefulWidget {
  final int currentIndex;

  const OnBorder3(this.currentIndex, {Key? key}) : super(key: key);

  @override
  _OnBorder3State createState() => _OnBorder3State();
}

class _OnBorder3State extends State<OnBorder3> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: LightThemeColors.secondColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)));

    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 0.50.sh,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                                height: 0.35.sh,
                                width: 0.8.sw,
                                child: Image.asset(
                                    "assets/images/onborder2.2.png")),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20.w,
                            ),
                            SizedBox(
                                height: 100.h,
                                width: 120.w,
                                child: Image.asset(
                                    "assets/images/onborder3.1.png")),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 140.h,
                        ),
                        SizedBox(
                            height: 0.28.sh,
                            child:
                                Image.asset("assets/images/onborder3.3.png")),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 160.w,
                            ),
                            SizedBox(height: 0.14.sh,child: Image.asset("assets/images/onborder3.2.png")),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 100.w,
                            ),
                            Image.asset(
                              "assets/images/onborder3.2.png",
                              height: 70.h,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Text(
                "نوفر التغليف الامن لجميع اللحوم",
                style: TextStyle(
                    fontSize: 21.sp,
                    color: LightThemeColors.primaryColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "نوفر لحوم الشواء والمناسبات",
                style: TextStyle(
                    fontSize: 18.sp,
                    color: LightThemeColors.primaryColor,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "توصيل مجاني لمدينة الجبيل",
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
                  buildCircle(widget.currentIndex == 2
                      ? LightThemeColors.lightGreyShade400
                      : Colors.amber),
                  SizedBox(
                    width: 8.w,
                  ),
                  buildCircle(widget.currentIndex == 2
                      ? LightThemeColors.lightGreyShade400
                      : Colors.amber),
                  SizedBox(
                    width: 8.w,
                  ),
                  buildCircle(widget.currentIndex == 2
                      ? Colors.amber
                      : LightThemeColors.lightGreyShade400),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 140.w,
                height: 45,
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
