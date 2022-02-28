import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/orders/model/data.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';


class OrderDetails extends StatefulWidget {
  Data data;
   OrderDetails({Key? key,required this.data,
   }) : super(key: key);

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {


  String formattedDate ='';
  String formattedDate2='' ;

  @override
  void initState() {
     formattedDate = DateFormat('yyyy-MM-dd','en').format(widget.data.created_at!);
     formattedDate2 = DateFormat('hh:mm','en').format(widget.data.created_at!);

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
                    child: Column(
                      children: [
                        Container(


                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                ,horizontal: 4.w
                            ),
                            child: Text('طريقة الدفع',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: LightThemeColors.darkBackgroundColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(


                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                ,horizontal: 4.w
                            ),
                            child: Text('اختر ما يناسبك لطرق الدفع',
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

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/clock2.svg',
                              width: 15.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(


                              child: Text('ملخص الطلب',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xff865E3B),
                                    fontFamily: "Nahdi",
                                    fontWeight: FontWeight.w900
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/clock.svg',
                              width: 15.w,
                            ),
                            Container(


                              child: Padding(
                                padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                    ,horizontal: 4.w
                                ),
                                child: Text('تاريخ الطلب'+' '+formattedDate,
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
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/half.svg',
                              width: 10.w,
                            ),
                            Container(


                              child: Padding(
                                padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                    ,horizontal: 4.w
                                ),
                                child: Text('الوقت'+' '+formattedDate2,
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
                      ],
                    ),
                  ),

                ],
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 12.w
                ),
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Divider(
                    thickness: 1,
                    color: LightThemeColors.lightGreyShade400,
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(


                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5.0.h
                              ,horizontal: 4.w
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset('assets/icons/house.svg',
                              width: 17.w,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(widget.data.city.name!+' '+widget.data.section.name!,
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
                      ),
                      Container(


                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: 5.0.h
                              ,horizontal: 4.w
                          ),
                          child: Text(widget.data.home!,
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: LightThemeColors.darkBackgroundColor,
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


                ],
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 12.w
                ),
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Divider(
                    thickness: 1,
                    color: LightThemeColors.lightGreyShade400,
                  ),
                ),
              ),


              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 12.w
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(


                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: 5.0.h
                            ,horizontal: 4.w
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset('assets/icons/clone.svg',
                              width: 22.w,
                              color:Color(0xff865E3B),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text('عناصر الطلب',
                              style: TextStyle(
                                  fontSize: 19.sp,
                                  color:Color(0xff865E3B),
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 12.w
                ),
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Divider(
                    thickness: 1,
                    color: LightThemeColors.lightGreyShade400,
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 12.w
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.0.h
                      ,horizontal: 4.w
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        flex: 3,
                        child: Text('المنتجات',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color:LightThemeColors.darkBackgroundColor,

                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      Expanded(
                        flex: 2,
                        child: Text('الكمية',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color:LightThemeColors.darkBackgroundColor,

                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),


                      Expanded(
                        flex: 2,
                        child: Text('السعر',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color:LightThemeColors.darkBackgroundColor,

                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 12.w
                ),
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Divider(
                    thickness: 1,
                    color: LightThemeColors.lightGreyShade400,
                  ),
                ),
              ),
              for(int i=0;i<widget.data.carts.length;i++)
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 12.w
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.0.h
                      ,horizontal: 4.w
                  ),
                  child: Row(

                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [

                            Text(widget.data.carts[i].size!.name!+'  '+
                                '('+widget.data.carts[i].size!.price.toString()+')',
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color:LightThemeColors.darkBackgroundColor,

                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            for(var add in widget.data.carts[i].additions!)
                              Text(add.name!+'  '+
                                  '('+add.price.toString()+')',
                                style: TextStyle(
                                    fontSize: 13.sp,
                                    color:LightThemeColors.darkBackgroundColor,

                                    fontWeight: FontWeight.w500
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 2,
                        child: Text(widget.data.carts[i].amount.toString(),
                          style: TextStyle(
                              fontSize: 14.sp,
                              color:LightThemeColors.darkBackgroundColor,

                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),


                      Expanded(
                        flex: 2,
                        child: Text(widget.data.carts[i].total.toString()+' '+' ر.س',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color:LightThemeColors.darkBackgroundColor,

                              fontWeight: FontWeight.w500
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
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
                        flex: 3,
                        child: Text('ضريبة القيمة المضافة',
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


                      Expanded(
                        flex: 2,
                        child: Text((widget.data.total_with_vat!-widget.data.total!).toString()+' '+' ر.س',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color:Color(0xffFF0000),
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                        flex: 3,
                        child: Text('رسوم التوصيل',
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


                      Expanded(
                        flex: 2,
                        child: Text(widget.data.delivery_price.toString()+' '+' ر.س',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color:Color(0xffFF0000),

                              fontFamily: "Nahdi",

                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                        flex: 3,
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


                      Expanded(
                        flex: 2,
                        child: Text((widget.data.total_with_vat!+widget.data.delivery_price).toString()+' '+' ر.س',
                          style: TextStyle(
                              fontSize: 15.sp,
                              color:Color(0xffFF0000),
                              fontFamily: "Nahdi",

                              fontWeight: FontWeight.w900
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 32.w
                ),
                child: SizedBox(
                  width: ScreenUtil().screenWidth,
                  child: Divider(
                    thickness: 1,
                    color: LightThemeColors.lightGreyShade400,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text('الدفع المستخدم',
                      style: TextStyle(
                          fontSize: 15.sp,
                          color:LightThemeColors.darkBackgroundColor,
                          fontFamily: 'Nahdi',

                          fontWeight: FontWeight.w900
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widget.data.payment_method=='transaction'?
                    Column(
                      children: [
                        Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                color: Color(0xff865E3B),
                              ),

                            ),
                            child:
                            Padding(
                              padding: const EdgeInsets.all(22),
                              child: Image.asset('assets/images/pay2.jpg'),
                            )),
                        SizedBox(height: 5.h,),
                        Text('تحويل بنكي',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: LightThemeColors.darkBackgroundColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ):
                     Column(
                children: [
                Container(
                height: 120.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      border: Border.all(
                        color: Color(0xff865E3B),
                      ),

                    ),
                    child:
                    Padding(
                      padding: const EdgeInsets.all(22),
                      child: Image.asset('assets/images/pay1.jpg'),
                    )),
                SizedBox(height: 5.h,),
                Text('دفع الكتروني',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: LightThemeColors.darkBackgroundColor,
                      fontFamily: "Nahdi",
                      fontWeight: FontWeight.w900
                  ),
                ),
            ],
          ),
                  ],
                ),
              ),
              SizedBox(height: 50.h,),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(

          showUnselectedLabels: true,
          onTap: (int index) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    Pages(
                      restCart: false,
                      pageNumber: index,
                    ),
              ),
                  (route) => false,
            );
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/house-damage.svg',
                  color:
                  LightThemeColors.lightGreyShade400,
                ),
                title: Text('الرئيسية',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),

            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset('assets/icons/dice.svg',
            //       color: select == 1 ? LightThemeColors.primaryColor :
            //       LightThemeColors.lightGreyShade400,
            //     ),
            //     title: Text('الاقسام',
            //       style: TextStyle(
            //         fontSize: 15.sp,
            //         color: select == 1 ? LightThemeColors.primaryColor :
            //         LightThemeColors.lightGreyShade400,
            //       ),
            //     )
            //
            // ),

            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/copy.svg',
                  color:
                  LightThemeColors.lightGreyShade400,
                ),
                title: Text('طلباتي',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),
            BottomNavigationBarItem(
                icon: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset('assets/icons/shopping-basket.svg',
                      color:
                      LightThemeColors.lightGreyShade400,
                    ),

                  ],
                ),
                title: Text('السلة',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/user-circle.svg',
                  color:
                  LightThemeColors.lightGreyShade400,
                ),
                title: Text('حسابي',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color:
                    LightThemeColors.lightGreyShade400,
                  ),
                )

            ),
          ],
        ),
      ),
    );
  }


}
