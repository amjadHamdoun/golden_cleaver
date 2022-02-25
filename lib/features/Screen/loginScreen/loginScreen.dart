import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'package:golden_cleaver/features/Screen/verify/verifyscreen.dart';
import 'package:golden_cleaver/injection.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'bloc/LoginBloc.dart';
import 'bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc = sl<LoginBloc>();
  TextEditingController email = TextEditingController(text: '');
  TextEditingController password = TextEditingController(text: '');

  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.loginModel!.message != null) {
          if (state.loginModel!.message!.length > 0) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.ERROR,
              animType: AnimType.BOTTOMSLIDE,
              title: 'فشل تسجيل الدخول',
              desc: state.loginModel!.message,
              btnCancelText: 'حسنا',
              btnCancelOnPress: () {},
            )..show();
          }
        } else if (state.errorMessage!.length > 0) {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'فشل تسجيل الدخول',
            desc: state.errorMessage,
            btnCancelText: 'حسنا',
            btnCancelOnPress: () {},
          )..show();
        } else if (state.loginModel!.data != null) {
          if (state.loginModel!.data!.api_token!.length > 0) {
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
              height: 1.sh,
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
                    padding: EdgeInsets.symmetric(vertical: 0.06.sh),
                    height: 1.sh,
                    width: double.infinity,
                    color: LightThemeColors.coverColor,
                    child: Column(
                      children: [
                        SizedBox(
                            height: 200.h,
                            child: SvgPicture.asset("assets/images/logo.svg")),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          "دخول الاعضاء",
                          style: TextStyle(
                              color: LightThemeColors.primaryColor,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: LightThemeColors.backgroundColor,
                              borderRadius: BorderRadius.circular(45)),
                          width: 0.9.sw,
                          height: 0.065.sh,
                          child: TextField(
                            controller: email,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                color: LightThemeColors.textColor),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(right: 25.w, left: 25.w),
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
                              hintText: "البريد الالكتروني",
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
                          width: 0.9.sw,
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
                              contentPadding:
                                  EdgeInsets.only(right: 25.w, left: 25.w),
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
                        FlatButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) => VerifyScreen());
                              Navigator.pushReplacement(context, route);
                            },
                            child: Text(
                              " نسيت كلمة المرور",
                              style: TextStyle(
                                  color: LightThemeColors.primaryColor,
                                  fontSize: 18.sp),
                            )),
                        SizedBox(
                          width: 0.7.sw,
                          height: 0.066.sh,
                          child: ElevatedButton(
                              onPressed: () {
                                bloc.onLogin(email.text, password.text);
                              },
                              child: Text(
                                "دخول",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: LightThemeColors.backgroundColor),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: LightThemeColors.blackColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(45)))),
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
