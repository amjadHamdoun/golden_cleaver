import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 22.w,
                    )),

                Text(
                  "غولدن كليفر",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: LightThemeColors.primaryColor,
                      fontSize: 18.sp),
                ),

                SizedBox(
                  width: 22.w,
                ),


              ],
            ),
            Divider(
              height: 10.h,
              thickness: 1.h,
              color: LightThemeColors.hintText,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "يسعدنا تلقي استفساراتكم واتصالاتكم",
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: LightThemeColors.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Image.asset(
                        'assets/icons/FontAwsome (headset).png',
                        height: 40.h,
                        width: 40.w,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "جوال-09101010101",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: LightThemeColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 60.w,
                      ),

                      Text(
                        "admin@admin.com",
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: LightThemeColors.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Divider(
                    height: 30.h,
                    thickness: 1.h,
                    color: LightThemeColors.hintText,
                  ),
                  SizedBox(

                      width: 400.w,
                      child: TextField(
                        style: TextStyle(
                            height: 1.h
                        ),

                        decoration: InputDecoration(

                            hintText: "الاسم",
                            hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: LightThemeColors.hintText),
                            border: OutlineInputBorder()),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(

                      width: 400.w,
                      child: TextField(
                        style: TextStyle(
                          height: 1.h
                        ),

                        decoration: InputDecoration(

                            hintText: "الجوال",
                            hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: LightThemeColors.hintText),
                            border: OutlineInputBorder()),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(

                      width: 400.w,
                      child: TextField(
                        style: TextStyle(
                            height: 1.h
                        ),

                        decoration: InputDecoration(

                            hintText: "العنوان",
                            hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: LightThemeColors.hintText),
                            border: OutlineInputBorder()),
                      )),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(

                      width: 400.w,
                      child: TextField(
                        style: TextStyle(
                            height: 1.h
                        ),
                        maxLines: 5,

                        decoration: InputDecoration(

                            hintText: "المحتوى",
                            hintStyle: TextStyle(
                                fontSize: 15.sp,
                                color: LightThemeColors.hintText),
                            border: OutlineInputBorder()),
                      )),
                  SizedBox(height: 15.h,),
                  SizedBox(
                    width: 0.7.sw,
                    height: 0.066.sh,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "ارسال",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: LightThemeColors.backgroundColor),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: LightThemeColors.blackColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(45)))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
