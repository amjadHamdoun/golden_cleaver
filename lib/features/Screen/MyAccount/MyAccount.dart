import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/Preference.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/contact_us/contanctUsScreen.dart';
import 'package:golden_cleaver/features/Screen/mainlog/mainlogscreen.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';
import 'package:golden_cleaver/features/Screen/who_are_we/WhoWeScreen.dart';

class MyAccount extends StatefulWidget {
  PagesBloc bloc;
   MyAccount({Key? key,required this.bloc}) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> with AutomaticKeepAliveClientMixin{
  @override
  void initState() {
    if(Global.userToken!.length>1)
      {
        widget.bloc.onUserDetailsEvent();
        widget.bloc.onGetNotificationsEvent();
      }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child:Global.userToken!.length>1?
            BlocConsumer<PagesBloc, PagesState>(
              bloc: widget.bloc,
              listener: (context, state) {

              },
              builder: (context, state) {
                if (state.isLoading!) {
                  return Container(
                    height: 0.9.sh,
                    child: Center(
                        child: CircularProgressIndicator(),
                      ),
                  );
                } else {
                  return Container(

                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "غولدن كليفر",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                            color: LightThemeColors.primaryColor),
                      ),
                      SizedBox(
                        height: 0.5.sh,
                        child: Stack(
                          children: [
                            Image.asset(
                              "assets/images/backgroundAccount.jpg",
                              height: 200.h,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/Account.svg",
                                      height: 60.h,
                                      width: 60.w,
                                    ),
                                  ],
                                ),
                                Text(
                                  state.userModel!.data!.name!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.sp,
                                      color: LightThemeColors.backgroundColor),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    widget.bloc.onSetCartsEvent([]);
                                    Preferences.saveUserToken('');
                                    Global.userToken='';
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => MainLog()),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30.h,
                                        width: 100.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: LightThemeColors.backgroundColor)),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            Text(
                                              "خروج",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                  color:
                                                  LightThemeColors.backgroundColor),
                                            ),
                                            SizedBox(
                                              width: 26.w,
                                            ),
                                            SvgPicture.asset(
                                              "assets/icons/back.svg",
                                              height: 13.h,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.5.w,
                                        color: LightThemeColors.secondColor),
                                    color: LightThemeColors.backgroundColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 13.h),
                                  height: 175.h,
                                  width: 300.w,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  child: SvgPicture.asset(
                                                    'assets/icons/Refreshmydata.svg',
                                                    height: 30.h,
                                                    color: LightThemeColors.secondColor,
                                                  ),
                                                ),
                                                Text(
                                                  'تحديث بياناتي',
                                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp,
                                                      color:
                                                      LightThemeColors.secondColor),
                                                )
                                              ],
                                            ),
                                          ),


                                          Container(
                                            height: 40.h,
                                            width: 1.w,
                                            color: LightThemeColors.textColor,
                                          ),

                                          Expanded(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    InkWell(
                                                      child: SvgPicture.asset(
                                                        'assets/icons/MyOrders.svg',
                                                        height: 30.h,
                                                        color:
                                                        LightThemeColors.secondColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  'طلباتي',
                                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp,
                                                      color:
                                                      LightThemeColors.secondColor),
                                                )
                                              ],
                                            ),
                                          ),

                                          Container(
                                            height: 40.h,
                                            width: 1.w,
                                            color: LightThemeColors.textColor,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      SvgPicture.asset(
                                                        'assets/icons/notifications.svg',
                                                        height: 30.h,
                                                        color: LightThemeColors.secondColor,
                                                      ),
                                                      if(state.notificationModel!.data!.length>0)
                                                        Positioned(
                                                          left: 17.w,
                                                          bottom: 14.h,
                                                          child: Container(
                                                            child: Text(state.notificationModel!.data!.length.toString(),
                                                              style: TextStyle(
                                                                  color: LightThemeColors.backgroundColor,
                                                                  fontSize: 12.sp
                                                              ),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                            width: 23.w,
                                                            height: 23.w,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: LightThemeColors.secondColor,
                                                            ),
                                                          ),
                                                        ),

                                                    ],
                                                  ),
                                                ),
                                                Text(
                                                  'الاشعارات',
                                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp,
                                                      color:
                                                      LightThemeColors.secondColor),
                                                )
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                      Divider(
                                        height: 40.h,
                                        thickness: 1.h,
                                        color: LightThemeColors.darkBackgroundColor,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => WhoWeScreen()),
                                                );
                                              },
                                              child: Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/who .svg',
                                                    height: 30.h,
                                                    color: LightThemeColors.secondColor,
                                                  ),
                                                  Text(
                                                    'من نحن',
                                                    style: TextStyle(fontWeight: FontWeight.bold,
                                                        fontSize: 12.sp,
                                                        color:
                                                        LightThemeColors.secondColor),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),


                                          Container(
                                            height: 40.h,
                                            width: 1.w,
                                            color: LightThemeColors.textColor,
                                          ),

                                          Expanded(
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/icons/FontAwsome (project-diagram).svg',
                                                  height: 30.h,
                                                  color: LightThemeColors.secondColor,
                                                ),
                                                Text(
                                                  'مشاركة التطبيق',
                                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                      fontSize: 10.sp,
                                                      color:
                                                      LightThemeColors.secondColor),
                                                )
                                              ],
                                            ),
                                          ),

                                          Container(
                                            height: 40.h,
                                            width: 1.w,
                                            color: LightThemeColors.textColor,
                                          ),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                InkWell(
                                                  onTap: (){Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => ContactUsScreen()),
                                                  );},
                                                  child: SvgPicture.asset(
                                                    'assets/icons/FontAwsome (envelope-open-text).svg',
                                                    height: 30.h,
                                                    color: LightThemeColors.secondColor,
                                                  ),
                                                ),
                                                Text(
                                                  'اتصل بنا',
                                                  style: TextStyle(fontWeight: FontWeight.bold,
                                                      fontSize: 12.sp,
                                                      color:
                                                      LightThemeColors.secondColor),
                                                )
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Container(
                        height: 0.045.sh,
                        width: 0.6.sw,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              "حساباتنا على التواصل",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14.sp,color: LightThemeColors.primaryColor),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: LightThemeColors.primaryColor, width: 0.5.h)),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/FontAwsome (snapchat).svg',
                                height: 50.h,
                                width: 50.w,
                              )),

                          SizedBox(width: 10.w,),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/FontAwsome (instagram).svg',
                                height: 50.h,
                                width: 50.w,
                              )),

                          SizedBox(width: 10.w,),
                          IconButton(
                              onPressed: () {

                              },
                              icon: SvgPicture.asset(
                                'assets/icons/FontAwsome (twitter).svg',
                                height: 50.h,
                                width: 50.w,
                              )),

                          SizedBox(width: 10.w,),
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icons/FontAwsome (whatsapp-square).svg',
                                height: 50.h,
                                width: 50.w,
                              ),),

                        ],
                      )
                    ],
                  ),
                );
                }
              },
            ):
            SizedBox(
              height: 0.9.sh,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5.h,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xffEAA947
                          ),),
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 8.0.h
                          ,horizontal: 4.w
                      ),
                      child: SizedBox(
                        width: 0.5.sw,

                        child: Text('يجب  تسجيل  الدخول',
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: LightThemeColors.primaryColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: LightThemeColors.darkBackgroundColor,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            MainLog(

                            )),
                      );
                    },

                    child:   SizedBox(
                      width: 0.5.sw,
                      child: Text('العودة  لتسجيل  الدخول',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: LightThemeColors.backgroundColor,
                            fontFamily: "Nahdi",
                            fontWeight: FontWeight.w900
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                  ),
                ],
              ),
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
