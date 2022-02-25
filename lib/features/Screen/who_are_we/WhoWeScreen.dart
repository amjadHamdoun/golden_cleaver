import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';

class WhoWeScreen extends StatefulWidget {
  const WhoWeScreen({Key? key}) : super(key: key);

  @override
  _WhoWeScreenState createState() => _WhoWeScreenState();
}

class _WhoWeScreenState extends State<WhoWeScreen> {
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
                Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 12.w
                  ),
                  child: Row(
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
                        width: 10.w,
                      ),

                    ],
                  ),
                ),
                Divider(
                  height: 10.h,
                  thickness: 1.h,
                  color: LightThemeColors.hintText,
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "من نحن",
                                  style: TextStyle(
                                      color: LightThemeColors.primaryColor,
                                      fontSize: 16.sp),
                                ),
                                Container(color: LightThemeColors.textColor,height: 1.h,width: 50.w,)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10.h,),
                        Text("غولدن كليبر هو متجر خاص ببيع اللحوم الطازجة بالجبيل",textAlign: TextAlign.start,style: TextStyle(
                            fontSize: 12.sp,fontWeight: FontWeight.bold
                        ),)
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
