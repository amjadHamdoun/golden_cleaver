import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'package:golden_cleaver/features/Screen/register/bloc/RegisterBloc.dart';
import 'package:golden_cleaver/features/Screen/register/bloc/register_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../injection.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterBloc bloc = sl<RegisterBloc>();
  TextEditingController name = TextEditingController(text: '');
  TextEditingController mobile = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');
  TextEditingController confirmPassword = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  bool checkBoxValue = true;
  bool _passwordVisible = true;
  bool _passwordVisible2 = true;
  String checkPassword = '';
  bool chek_Password_Boolian = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.registerModel!.message != null) {
          if (state.registerModel!.message!.length > 0) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: 'فشل تسجيل الحساب',
              desc: state.registerModel!.message,
              btnCancelText: 'حسنا',
              btnCancelOnPress: () {},
            )..show();
          }
        }
        else if (state.errorMessage!.length > 0) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'فشل تسجيل الحساب',
            desc: state.errorMessage,
            btnCancelText: 'حسنا',
            btnCancelOnPress: () {},
          )..show();
        } else if (state.registerModel!.data != null) {
          if (state.registerModel!.data!.api_token!.length > 0) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Pages(
                  restCart: true,
                  pageNumber: 0,
                ),
              ),
              (route) => false,
            );
          }
        }

        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
            child: ModalProgressHUD(
          inAsyncCall: state.isLoading!,
          color: LightThemeColors.backgroundColor,
          progressIndicator: CircularProgressIndicator(
            color: LightThemeColors.primaryColor,
          ),
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
                        padding: EdgeInsets.symmetric(vertical: 0.02.sh),
                        height: 1.sh,
                        width: double.infinity,
                        color: LightThemeColors.coverColor,
                        child: Column(
                          children: [
                            SizedBox(
                                height: 180.h,
                                child: SvgPicture.asset("assets/images/logo.svg")),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              "تسجيل الاعضاء",
                              style: TextStyle(
                                  color: LightThemeColors.primaryColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: LightThemeColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(45)),
                              width: 0.8.sw,
                              height: 0.065.sh,
                              child: TextField(
                                controller: name,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    color: LightThemeColors.textColor),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(right: 25.w,left: 25.w),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  hintText: "الاسم",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: LightThemeColors.lightGreyShade400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: LightThemeColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(45)),
                              width: 0.8.sw,
                              height: 0.065.sh,
                              child: TextField(
                                keyboardType: TextInputType.phone,
                                controller: mobile,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    color: LightThemeColors.textColor),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(right: 25.w,left: 25.w),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  hintText: "رقم الجوال",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: LightThemeColors.lightGreyShade400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: LightThemeColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(45)),
                              width: 0.8.sw,
                              height: 0.065.sh,
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    color: LightThemeColors.textColor),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(right: 25.w,left: 25.w),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  hintText: "الايميل",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: LightThemeColors.lightGreyShade400),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: LightThemeColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(45)),
                              width: 0.8.sw,
                              height: 0.065.sh,
                              child: TextField(
                                controller: password,
                                obscureText: _passwordVisible,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    color: LightThemeColors.textColor),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    iconSize: 18.w,
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: LightThemeColors.lightGreyShade400,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                  contentPadding: EdgeInsets.only(right: 25.w,left: 25.w),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  hintText: "الرقم السري",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: LightThemeColors.hintText),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: LightThemeColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(45)),
                              width: 0.8.sw,
                              height: 0.065.sh,
                              child: TextField(
                                onChanged: (str) {
                                  setState(() {
                                    checkPassword = str;
                                    checkPassword == password.text
                                        ? chek_Password_Boolian = true
                                        : chek_Password_Boolian = false;
                                  });
                                },
                                controller: confirmPassword,
                                obscureText: _passwordVisible2,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    color: LightThemeColors.textColor),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    iconSize: 18.w,
                                    icon: Icon(
                                      // Based on passwordVisible state choose the icon
                                      _passwordVisible2
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: LightThemeColors.lightGreyShade400,
                                    ),
                                    onPressed: () {
                                      // Update the state i.e. toogle the state of passwordVisible variable
                                      setState(() {
                                        _passwordVisible2 = !_passwordVisible2;
                                      });
                                    },
                                  ),
                                  contentPadding: EdgeInsets.only(right: 25.w,left: 25.w),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide: BorderSide(
                                          width: 2,
                                          color: LightThemeColors.backgroundColor)),
                                  hintText: "اعادة الرقم السري",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(16),
                                      color: LightThemeColors.hintText),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Checkbox(
                                          value: checkBoxValue,
                                          activeColor: Colors.green,
                                          onChanged: (bool? newValue) async {
                                            setState(() {
                                              checkBoxValue = newValue!;
                                            });
                                            Text("Remember me");
                                          }),
                                    ],
                                  ),
                                ),
                                Text(
                                  "الموافقة عللى اتفاقية المتجر",
                                  style: TextStyle(
                                      color: LightThemeColors.primaryColor,
                                      fontSize: 14.sp),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 0.6.sw,
                              height: 0.06.sh,
                              child: ElevatedButton(
                                  onPressed: checkBoxValue
                                      ? () {
                                    if(email.text.length>0&&mobile.text.length>0&&password.text.length>0
                                        &&name.text.length>0&&confirmPassword.text.length>0)
                                      {
                                        chek_Password_Boolian == true
                                            ? bloc.onRegister(
                                            email.text,
                                            mobile.text,
                                            password.text,
                                            name.text,
                                            confirmPassword.text)
                                            : Fluttertoast.showToast(
                                            msg: "كلمات السر غير متطابقة",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: LightThemeColors
                                                .lightGreyShade400,
                                            textColor: LightThemeColors
                                                .backgroundColor,
                                            fontSize: 15.0.sp);
                                      }
                                    else
                                    Fluttertoast.showToast(
                                        msg: "يرجر ملىْ جميع الحقول",
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: LightThemeColors
                                            .lightGreyShade400,
                                        textColor: LightThemeColors
                                            .backgroundColor,
                                        fontSize: 15.0.sp);

                                  }
                                      : null,
                                  child: Text(
                                    "تسجيل",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        color: LightThemeColors.backgroundColor,
                                    fontWeight: FontWeight.bold),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: LightThemeColors.blackColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(45)))),
                            ),
                            SizedBox(
                              height: 55.h,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
        ));
      },
    );
  }
}
