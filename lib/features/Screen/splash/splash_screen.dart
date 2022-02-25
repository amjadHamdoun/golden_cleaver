import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/Preference.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/mainlog/mainlogscreen.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'package:golden_cleaver/features/Screen/pageviewscreen.dart';
import 'package:golden_cleaver/features/Screen/splash/bloc/settings_state.dart';
import 'package:golden_cleaver/features/Screen/splash/model/settings_model.dart';

import '../../../injection.dart';
import 'bloc/SettingsBloc.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SettingsBloc bloc = sl<SettingsBloc>();
  @override
  void initState() {
    bloc.onSettingsGetEvent();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      bloc:bloc ,
      listener: (context, state) {
        if(state.settingsModel!.data !=null)
        {
          Global.tax=state.settingsModel!.data!.tax_amount;
          Global.userToken = Preferences.getUserToken();

          if (Global.userToken!.length > 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>
                  Pages(
                    pageNumber: 0,
                    restCart: false,
                  )),
            );
          }
          else {
            bool? firstTime = Preferences.getIsFirstTime();
            if (firstTime!) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => PageViewScreen()),
              );
            }
            else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainLog()),
              );
            }
          }
        }else if(state.errorMessage!.length>0){
          Fluttertoast.showToast(
              msg: "حدث خطأ ما",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: LightThemeColors
                  .lightGreyShade400,
              textColor: LightThemeColors
                  .backgroundColor,
              fontSize: 15.0.sp);
          Future.delayed(Duration(seconds: 2)).then((value) {
            bloc.onSettingsGetEvent();

          });

        }

      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Stack(children: [
                Column(
                  children: [
                    SizedBox(
                        width: double.infinity,
                        height: 0.37.sh,
                        child: Image.asset(
                          "assets/images/splash1.png",
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                        width: double.infinity,
                        height: 0.61.sh,
                        child: Image.asset(
                          "assets/images/splash2.png",
                          fit: BoxFit.fill,
                        )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 0.30.sh,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 20.w,
                        ),
                        Image.asset(
                          "assets/images/splash4-removebg-preview.png",
                          height: 45.h,
                        ),
                        Image.asset(
                          "assets/images/splash4-removebg-preview.png",
                          height: 100.h,
                        ),
                        Image.asset(
                          "assets/images/splash4-removebg-preview.png",
                          height: 55.h,
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 80.h, width: 60.w,
                            child: SvgPicture.asset("assets/images/logo.svg")
                        ),
                        SizedBox(
                          height: 200.h,
                        ), SizedBox(height: 80.h, width: 60.w, child: SvgPicture
                            .asset("assets/images/logo.svg"),)
                      ],
                    )
                  ],
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
