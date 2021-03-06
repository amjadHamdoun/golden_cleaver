import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bank_transfer.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/MyBankBloc.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/myBank_state.dart';
import 'package:golden_cleaver/features/Screen/credit_card/credit_card.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';


class PaymentType extends StatefulWidget {
  MyBankBloc bloc;
   PaymentType({Key? key,required this.bloc}) : super(key: key);

  @override
  _PaymentTypeState createState() => _PaymentTypeState();
}

class _PaymentTypeState extends State<PaymentType> {


  String formattedDate = DateFormat('yyyy-MM-dd','en').format((DateTime.now()));
  String formattedDate2 = DateFormat('hh:mm','en').format((DateTime.now()));

  @override
  void initState() {
    widget.bloc.onGetCartsEvent();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBankBloc, MyBankState>(
      bloc: widget.bloc,
  listener: (context, state) {

  },
  builder: (context, state) {
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
                    Text(' ?????????? ??????????',
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
                            child: Text('?????????? ??????????',
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
                            child: Text('???????? ???? ???????????? ???????? ??????????',
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


                              child: Text('???????? ??????????',
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
                                child: Text('?????????? ??????????'+' '+formattedDate,
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
                                child: Text('??????????'+' '+formattedDate2,
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
                              Text(state.cityName!+' '+state.sectionName!,
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
                          child: Text(state.home!,
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
                            Text('?????????? ??????????',
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
                        child: Text('????????????????',
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
                        child: Text('????????????',
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
                        child: Text('??????????',
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
              for(int i=0;i<state.carts!.length;i++)
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
                            Text(state.carts![i].name!,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color:LightThemeColors.darkBackgroundColor,

                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(state.carts![i].sizeName!+' '+'('+state.carts![i].sizePrice.toString()+')',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color:LightThemeColors.darkBackgroundColor,

                                  fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                            for(var add in state.carts![i].additions)
                              Text(add.name!+' '+'('+add.price.toString()+')',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    color:LightThemeColors.primaryColor,

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
                        child: Text(state.carts![i].amount.toString(),
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
                        child: Text(state.carts![i].price.toString()+' '+' ??.??',
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
                        child: Text('?????????? ???????????? ??????????????',
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
                        child: Text((
                            double.tryParse(state.totalWithVat!)!-
                                double.tryParse(state.total!)!
                        )
                        .toString()+' '+' ??.??',
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
                        child: Text('???????? ??????????????',
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
                        child: Text(state.deliveryPrice.toString()+' '+' ??.??',
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
                        child: Text('??????????????',
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
                        child: Text((double.tryParse(state.totalWithVat!)!+state.deliveryPrice!).toString()+' '+' ??.??',
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
                    child: Text('???????????? ?????????? ???? ???????? ?????????? ??????????',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreditCard()),
                      );
                    },
                    child: Column(
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
                        Text('?????? ????????????????',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: LightThemeColors.darkBackgroundColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w,),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BankTransfer(
                          bloc: widget.bloc,
                        )),
                      );
                    },
                    child: Column(
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
                        Text('?????????? ????????',
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: LightThemeColors.darkBackgroundColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                title: Text('????????????????',
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
            //     title: Text('??????????????',
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
                title: Text('????????????',
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
                    if(state.carts!.length>0)
                      Positioned(
                        left: 20.w,
                        bottom: 10.h,
                        child: Container(
                          child: Text(state.carts!.length.toString(),
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
                            color:
                            LightThemeColors.lightGreyShade400,
                          ),
                        ),
                      ),
                  ],
                ),
                title: Text('??????????',
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
                title: Text('??????????',
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
  },
);
  }


}
