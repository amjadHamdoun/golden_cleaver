
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/data.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:ui' as ui;

import '../../../injection.dart';

class AccountDetails extends StatefulWidget {
  UserData? userMyaccountModel;

   AccountDetails({Key? key, this.userMyaccountModel}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  PagesBloc bloc =sl<PagesBloc>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
 @override
  void initState() {
   nameController.text=widget.userMyaccountModel!.name!;
   emailController.text=widget.userMyaccountModel!.email!;
   phoneController.text=widget.userMyaccountModel!.mobile!;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<PagesBloc, PagesState>(
          bloc: bloc,
          listener: (context, state) {
          if(state.isSuccess!)
            Navigator.pop(context,true);


          },
          builder: (context, state) {

            return ModalProgressHUD(
              inAsyncCall: state.isLoading!,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
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
                      height: 20.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'البيانات الشخصية',
                          style: TextStyle(
                            color: LightThemeColors.textColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Noto',
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10),
                          horizontal: ScreenUtil().setWidth(10)),
                      child: Text(
                        'الأسم',
                        style: TextStyle(
                          color: LightThemeColors.textColor,
                          fontSize: 15.sp,
                          fontFamily: 'Noto',),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: ScreenUtil().screenWidth * 0.95,
                          height: 50.h,
                          color: Colors.grey.shade50,
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: ui.TextDirection.rtl,
                            children: [
                              Expanded(
                                child: TextField(
                                  textDirection: ui.TextDirection.rtl,
                                  style: TextStyle(
                                    color: LightThemeColors.textColor,
                                    fontSize: 14.sp,
                                    fontFamily: 'Noto',
                                  ),
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide( color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person_rounded,
                                        size: ScreenUtil().setWidth(20),
                                        color: LightThemeColors.textColor,
                                        textDirection: ui.TextDirection.ltr,
                                      ),
                                      hintTextDirection: ui.TextDirection.rtl,
                                      hintText: 'الأسم'.toString(),
                                      hintStyle: TextStyle(
                                        color: LightThemeColors.textColor,
                                        fontSize: 12.sp,
                                        fontFamily: 'Noto',
                                      ),
                                      labelStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                      )),
                                  onChanged: (text) {},
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10),
                          horizontal: ScreenUtil().setWidth(10)),
                      child: Text(
                        'البريد الالكتروني',
                        style: TextStyle(
                          color: LightThemeColors.textColor,
                          fontSize: 14.sp,
                          fontFamily: 'Noto',),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: ScreenUtil().screenWidth * 0.95,
                          height: 50.h,
                          color: Colors.grey.shade50,
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: ui.TextDirection.rtl,
                            children: [

                              Expanded(
                                child: TextField(

                                  textDirection: ui.TextDirection.rtl,
                                  readOnly: true,
                                  style: TextStyle(
                                    color: LightThemeColors.textColor,
                                    fontSize: 14.sp,
                                    fontFamily: 'Noto',
                                  ),
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide( color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        size: ScreenUtil().setWidth(20),
                                        color: LightThemeColors.textColor,
                                        textDirection: ui.TextDirection.ltr,
                                      ),
                                      hintTextDirection: ui.TextDirection.rtl,
                                      hintText: 'email@examble.com'.toString(),
                                      hintStyle: TextStyle(
                                        color: LightThemeColors.textColor,
                                        fontSize: 12.sp,
                                        fontFamily: 'Noto',
                                      ),
                                      labelStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                      )),
                                  onChanged: (text) {},
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10),
                          horizontal: ScreenUtil().setWidth(10)),
                      child: Text(
                        'الرقم',
                        style: TextStyle(
                          color: LightThemeColors.textColor,
                          fontSize: 14.sp,
                          fontFamily: 'Noto',),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: ScreenUtil().screenWidth * 0.95,
                          height: 50.h,
                          color: Colors.grey.shade50,
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: ui.TextDirection.rtl,
                            children: [
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.phone,
                                  textDirection: ui.TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                  ),
                                  controller: phoneController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide( color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        size: ScreenUtil().setWidth(20),
                                        color: LightThemeColors.textColor,
                                        textDirection: ui.TextDirection.ltr,
                                      ),
                                      hintTextDirection: ui.TextDirection.rtl,
                                      hintText: 'Number phone'.toString(),
                                      hintStyle: TextStyle(
                                        color: LightThemeColors.textColor,
                                        fontSize: 12.sp,
                                        fontFamily: 'Noto',
                                      ),
                                      labelStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                      )),
                                  onChanged: (text) {},
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10),
                          horizontal: ScreenUtil().setWidth(10)),
                      child: Text(
                        'المدينة',
                        style: TextStyle(
                          color: LightThemeColors.textColor,
                          fontSize: 14.sp,
                          fontFamily: 'Noto',),
                      ),
                    ),
                    Center(
                      child: Container(
                          width: ScreenUtil().screenWidth * 0.95,
                          height: 50.h,
                          color: Colors.grey.shade50,
                          padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(5)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: ui.TextDirection.rtl,
                            children: [
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  textDirection: ui.TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(14),
                                  ),
                                  controller: cityController,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide( color: LightThemeColors.textColor, width: 2.0),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.location_city,
                                        size: ScreenUtil().setWidth(20),
                                        color: LightThemeColors.textColor,
                                        textDirection: ui.TextDirection.ltr,
                                      ),
                                      hintTextDirection: ui.TextDirection.rtl,
                                      hintText: 'city'.toString(),
                                      hintStyle: TextStyle(
                                        color: LightThemeColors.textColor,
                                        fontSize: 12.sp,
                                        fontFamily: 'Noto',
                                      ),
                                      labelStyle: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                      )),
                                  onChanged: (text) {},
                                ),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: ScreenUtil().screenHeight * 0.08,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          color: LightThemeColors.darkBackgroundColor,
                          onPressed: (){
                            if(nameController.text.isNotEmpty&&
                                emailController.text.isNotEmpty&&
                                phoneController.text.isNotEmpty&&
                                emailController.text.contains('@')&&
                                emailController.text.contains('.com')
                            )
                            bloc.onUserUpdatesEvent
                              (name: nameController.text,
                                email: emailController.text,
                                mobile: phoneController.text,
                                city: cityController.text);
                            else
                              Fluttertoast.showToast(
                                  msg: 'يرجى ادخال اسم وبريد الكتروني صالح ورقم هاتف',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: LightThemeColors.lightGreyShade400,
                                  textColor: LightThemeColors.backgroundColor,
                                  fontSize: 15.0.sp
                              );
                          },

                          child:  Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 115.w,
                                vertical: 8.h
                            ),
                            child: Text('حفظ',
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
                      ],
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
