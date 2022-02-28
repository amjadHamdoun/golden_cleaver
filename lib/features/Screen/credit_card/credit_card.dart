import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';


class CreditCard extends StatefulWidget {
  const CreditCard({Key? key}) : super(key: key);

  @override
  _CreditCardState createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {


  String formattedDate = DateFormat('yyyy-MM-dd','en').format((DateTime.now()));
  String formattedDate2 = DateFormat('hh:mm','en').format((DateTime.now()));
  bool done=false;

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 25.h,),
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
                width: ScreenUtil().screenWidth,
                child: Divider(
                  thickness: 1,
                  color: LightThemeColors.lightGreyShade400,
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(


                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5.0.h
                              ,horizontal: 28.w
                          ),
                          child: Row(
                            children: [
                              Text('دفع الكتروني',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: LightThemeColors.darkBackgroundColor,
                                    fontFamily: "Nahdi",
                                    fontWeight: FontWeight.w900
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Container(


                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                ,horizontal: 4.w
                            ),
                            child: Text(' قد يترتب رسوم اضافية من قبل شركات الدفع',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: LightThemeColors.lightGreyShade400,
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
                  ),
                  Expanded(

                    child: SizedBox(),
                  ),

                ],
              ),

              SizedBox(height: 10.h,),




                if(!done)
                  Column(
                    children: [
                      SizedBox(height: 5.h,),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 12.w
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 2.0.h
                              ,horizontal: 4.w
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [


                              Expanded(
                                flex: 2,
                                child: Text('المجموع',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color:LightThemeColors.darkBackgroundColor,
                                      fontFamily: 'Nahdi',

                                      fontWeight: FontWeight.w900
                                  ),
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),


                              Expanded(
                                flex: 2,
                                child: Text('70'+' '+' ر.س',
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      color:Color(0xffFF0000),
                                      fontFamily: "Nahdi",

                                      fontWeight: FontWeight.w900
                                  ),
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h,),

                      Container(
                        width: 0.9.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: LightThemeColors.darkBackgroundColor,
                              width: 1.6
                          ),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(16.w),
                          child: Column(
                            children: [
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 0.8.sw,
                                    child:  TextField(
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          height: 0.7.h,
                                          color: Colors.black
                                      ),
                                      maxLines: 1,
                                      decoration: new InputDecoration(
                                        hintText: 'الاسم على البطاقة',
                                        hintStyle:TextStyle(
                                            fontSize: 13.sp,
                                            height: 0.7.h,
                                            color: LightThemeColors.lightGreyShade400
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                            borderRadius: BorderRadius.circular(2)
                                        ),

                                      ),



                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 0.8.sw,
                                    child:  TextField(
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          height: 0.7.h,
                                          color: Colors.black
                                      ),
                                      maxLines: 1,
                                      decoration: new InputDecoration(
                                        hintText: 'رقم البطاقة',
                                        hintStyle:TextStyle(
                                            fontSize: 13.sp,
                                            height: 0.7.h,
                                            color: LightThemeColors.lightGreyShade400
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                            borderRadius: BorderRadius.circular(2)
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                            borderRadius: BorderRadius.circular(2)
                                        ),

                                      ),



                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              Container(
                                width: 0.8.sw,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(

                                      child:  TextField(
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          height: 0.7.h,
                                          color: Colors.black,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        decoration: new InputDecoration(
                                          hintText: '01',
                                          hintStyle:TextStyle(
                                              fontSize: 13.sp,
                                              height: 0.7.h,
                                              color: LightThemeColors.lightGreyShade400
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                              borderRadius: BorderRadius.circular(2)
                                          ),

                                        ),



                                      ),
                                    ),
                                    SizedBox(width: 10.w,),

                                    Expanded(

                                      child:  TextField(
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            height: 0.7.h,
                                            color: Colors.black
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        decoration: new InputDecoration(
                                          hintText: '2020',
                                          hintStyle:TextStyle(
                                              fontSize: 13.sp,
                                              height: 0.7.h,
                                              color: LightThemeColors.lightGreyShade400
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                              borderRadius: BorderRadius.circular(2)
                                          ),

                                        ),



                                      ),
                                    ),
                                    SizedBox(width: 10.w,),
                                    Expanded(

                                      child:  TextField(
                                        style: TextStyle(
                                            fontSize: 15.sp,
                                            height: 0.7.h,
                                            color: Colors.black
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        decoration: new InputDecoration(
                                          hintText: 'cvv',
                                          hintStyle:TextStyle(
                                              fontSize: 13.sp,
                                              height: 0.7.h,
                                              color: LightThemeColors.lightGreyShade400
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                              borderRadius: BorderRadius.circular(2)
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                              borderRadius: BorderRadius.circular(2)
                                          ),

                                        ),



                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h,),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,),
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        color: LightThemeColors.darkBackgroundColor,
                        onPressed: (){
                          done =true;
                          setState(() {

                          });
                        },

                        child:  Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 85.w,
                              vertical: 8.h
                          ),
                          child: Text('الدفع',
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
                      SizedBox(height: 10.h,),



                      SizedBox(height: 50.h,),
                    ],
                  ),
              if(done)
                Column(
                  children: [
                    SizedBox(height: 15.h,),

                    Container(
                      width: 0.9.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color(0xffDEC279)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.all(16.w),
                        child: Column(
                          children: [
                            SizedBox(height: 70.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 0.8.sw,
                                  child:  Text('شكرا',
                                    style: TextStyle(
                                        fontSize: 27.sp,
                                        color: LightThemeColors.backgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 0.8.sw,
                                  child:  Text('تم الدفع بنجاح يمكنك متابعة طلبك',
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        color: LightThemeColors.darkBackgroundColor,
                                        fontFamily: "Nahdi",
                                        fontWeight: FontWeight.w900
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 20.h,),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              color: LightThemeColors.darkBackgroundColor,
                              onPressed: (){
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => Pages(
                                      restCart: true,
                                      pageNumber: 1,
                                    ),
                                  ),
                                      (route) => false,
                                );

                              },

                              child:  Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 85.w,
                                    vertical: 8.h
                                ),
                                child: Text('طلباتي',
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
                            SizedBox(height: 70.h,),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                  ],
                )


            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
