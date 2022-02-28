import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/loginScreen/loginScreen.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'package:golden_cleaver/features/Screen/register/registerScreen.dart';

class MainLog extends StatefulWidget {
  const MainLog({Key? key}) : super(key: key);

  @override
  _MainLogState createState() => _MainLogState();
}

class _MainLogState extends State<MainLog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: Stack(

          children: [
            SizedBox( 
                height: 1.sh,
                child: Image.asset(
                  "assets/images/background_login.png",
                  fit: BoxFit.cover,
                )),
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.symmetric(vertical: 0.08.sh),
              height: 1.sh,
              width: double.infinity,
              color: LightThemeColors.coverColor,
              child: Column(
                children: [
                  SizedBox(
                      height: 230.h,
                      child: SvgPicture.asset("assets/images/logo.svg")),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "مرحبا بكم في غولدن كليبر",
                    style: TextStyle(
                        color: LightThemeColors.primaryColor,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 0.7.sw,
                    height: 0.07.sh,
                    child: ElevatedButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(builder: (context) => LoginScreen());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "دخول",
                          style: TextStyle(fontSize: 18.sp,color: LightThemeColors.backgroundColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: LightThemeColors.secondColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)))),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 0.7.sw,
                    height: 0.07.sh,
                    child: ElevatedButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(builder: (context) => RegisterScreen());
                          Navigator.push(context, route);
                        },
                        child: Text(
                          "تسجيل",
                          style: TextStyle(fontSize: 18.sp,color: LightThemeColors.backgroundColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: LightThemeColors.secondColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)))),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 0.7.sw,
                    height: 0.07.sh,
                    child: ElevatedButton(
                        onPressed: () {
                          Route route = MaterialPageRoute(builder: (context) => Pages(
                              restCart: true,
                              pageNumber: 0
                          ));
                          Navigator.pushReplacement(context, route);
                        },
                        child: Text(
                          "تخطي",
                          style: TextStyle(fontSize: 18.sp,color: LightThemeColors.backgroundColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: LightThemeColors.blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)))),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
