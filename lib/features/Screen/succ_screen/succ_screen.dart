import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/MyBankBloc.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/myBank_state.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'package:image_picker/image_picker.dart';


class SuccScreen extends StatefulWidget {

  SuccScreen({Key? key}) : super(key: key);

  @override
  _SuccScreenState createState() => _SuccScreenState();
}

class _SuccScreenState extends State<SuccScreen> {


  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Pages(
                                    restCart: true,
                                    pageNumber: 2,
                                  ),
                            ),
                                (route) => false,
                          );
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: LightThemeColors.darkBackgroundColor,
                          size: 22.w,
                        ),
                      ),
                      Text(
                        ' غولدن كليفر',
                        style: TextStyle(
                            fontSize: 19.sp,
                            color: LightThemeColors.primaryColor,
                            fontFamily: "Nahdi",
                            fontWeight: FontWeight.w900),
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
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0.h, horizontal: 28.w),
                            child: Row(
                              children: [
                                Text(
                                  'التحويل البنكي',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: LightThemeColors
                                          .darkBackgroundColor,
                                      fontFamily: "Nahdi",
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5.0.h, horizontal: 28.w),
                            child: Row(
                              children: [
                                Container(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0.h, horizontal: 4.w),
                                    child: Text(
                                      'الحساب البنكية',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: LightThemeColors
                                              .lightGreyShade400,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      width: 0.9.sw,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Color(0xffDEC279)),
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 0.8.sw,
                                  child: Text(
                                    'شكرا',
                                    style: TextStyle(
                                        fontSize: 27.sp,
                                        color: LightThemeColors
                                            .backgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 0.8.sw,
                                  child: Text(
                                    'تم الارسال بنجاح ',
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        color: LightThemeColors
                                            .darkBackgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 0.8.sw,
                                  child: Text(
                                    'سيتم مراجعة عملية التحويل وتفعيل الطلب',
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        color: LightThemeColors
                                            .darkBackgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: LightThemeColors.darkBackgroundColor,
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Pages(
                                          restCart: true,
                                          pageNumber: 2,
                                        ),
                                  ),
                                      (route) => false,
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 85.w, vertical: 8.h),
                                child: Text(
                                  'طلباتي',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color:
                                      LightThemeColors.backgroundColor,
                                      fontFamily: "Nahdi",
                                      fontWeight: FontWeight.w900),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }


}

