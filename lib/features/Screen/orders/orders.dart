import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/mainlog/mainlogscreen.dart';
import 'package:golden_cleaver/features/Screen/order_details/order_details.dart';
import 'package:golden_cleaver/features/Screen/order_state/order_state.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';


class Orders extends StatefulWidget {
  PagesBloc bloc;
   Orders({Key? key,required this.bloc}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders>  with AutomaticKeepAliveClientMixin{





  DateFormat format =  DateFormat('yyyy/MM/dd  hh:mm','en');

  @override
  void initState() {
   widget.bloc.onGetOrdersEvent();
    super.initState();
  }


  @override
  Widget build(context) {
    return BlocConsumer<PagesBloc, PagesState>(
      bloc: widget.bloc,
      listener: (context, state) {

      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: RefreshIndicator(
              onRefresh: ()async{
                widget.bloc.onGetOrdersEvent();
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child:
                Global.userToken!.length>1?
                state.isLoadingOrders!?
                    SizedBox(
                      height: 0.8.sh,
                      child: Center(child: CircularProgressIndicator()),
                    ):
                state.errorMessage!.length>0?
                Container(
                  height: 0.8.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/oops.svg',
                        width: 92.w,
                        color: LightThemeColors.darkBackgroundColor,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(state.errorMessage!,
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: LightThemeColors.primaryColor,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ):
                Column(
                  children: [
                    SizedBox(height: 25.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' غولدن كليفر',
                          style: TextStyle(
                              fontSize: 19.sp,
                              color: LightThemeColors.primaryColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                        )
                      ],
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
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.w),
                          child: Container(


                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                  ,horizontal: 4.w
                              ),
                              child: Text('كل الطلبات',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: LightThemeColors.darkBackgroundColor,
                                    fontFamily: "Nahdi",
                                    fontWeight: FontWeight.w900
                                ),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 4.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.w),
                          child: Container(


                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                  ,horizontal: 4.w
                              ),
                              child: Text('يمكن متابعة الطلب وحالة الطلب',
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
                        ),

                      ],
                    ),
                    SizedBox(height: 10.h,),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.orderModel!.data!.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if(state.orderModel!.data![index].status=='pending')
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OrderState(
                                  state: state.orderModel!.data![index].status_ar!,
                                  id: state.orderModel!.data![index].id!,
                                  date: format.format(state.orderModel!.data![index].created_at!),
                                )),
                              );
                            },

                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 12.w
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('رقم الطلب'+'  '+state.orderModel!.data![index].id.toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: LightThemeColors.darkBackgroundColor,
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.h,),
                                            Row(
                                              children: [
                                                Text('تاريخ الطلب'+'     '+format.format(state.orderModel!.data![index].created_at!)
                                                    ,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: LightThemeColors.darkBackgroundColor,
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.h,),

                                            Row(
                                              children: [

                                                InkWell(
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => OrderDetails(
                                                        data: state.orderModel!.data![index],
                                                      )),
                                                    );
                                                  },
                                                  child: Text('تفاصيل الطلب'
                                                    ,
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color:   Color(0xff2D9CC5),
                                                        fontFamily: "Nahdi",
                                                        fontWeight: FontWeight.w900,

                                                    ),
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                )

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:  EdgeInsets.only(left: 12.w),
                                          child: Column(

                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: ScreenUtil().screenWidth*0.37,
                                                    child:Padding(
                                                      padding:  EdgeInsets.symmetric(

                                                          vertical: 6.h

                                                      ),
                                                      child: Text(state.orderModel!.data![index].status_ar!,
                                                        style: TextStyle(
                                                            fontSize: 11.sp,
                                                            color: LightThemeColors.backgroundColor,
                                                            fontFamily: "Nahdi",
                                                            fontWeight: FontWeight.w900
                                                        ),
                                                        textAlign: TextAlign.center,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ) ,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff2D9CC5),
                                                      borderRadius: BorderRadiusDirectional.circular(25),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:  EdgeInsets.symmetric(
                                                        horizontal: 12.w
                                                    ),
                                                    child: Icon(Icons.arrow_forward_ios,
                                                      size: 17.w,

                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 25.h,
                                ),
                              ],
                            ),
                          );
                        else   if(state.orderModel!.data![index].status=='ongoing')
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OrderState(
                                  state: state.orderModel!.data![index].status_ar!,
                                  id: state.orderModel!.data![index].id!,
                                  date: format.format(state.orderModel!.data![index].created_at!),
                                )),
                              );
                            },

                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 12.w
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('رقم الطلب'+'  '+state.orderModel!.data![index].id.toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: LightThemeColors.darkBackgroundColor,
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.h,),
                                            Row(
                                              children: [
                                                Text('تاريخ الطلب'+'     '+format.format(state.orderModel!.data![index].created_at!),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: LightThemeColors.darkBackgroundColor,
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.h,),

                                            Row(
                                              children: [

                                                InkWell(
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => OrderDetails(
                                                        data: state.orderModel!.data![index],
                                                      )),
                                                    );
                                                  },
                                                  child: Text('تفاصيل الطلب'
                                                    ,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color:   Color(0xff2D9CC5),
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900,

                                                    ),
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                )

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:  EdgeInsets.only(left: 12.w),
                                          child: Column(

                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: ScreenUtil().screenWidth*0.37,
                                                    child:Padding(
                                                      padding:  EdgeInsets.symmetric(

                                                          vertical: 6.h

                                                      ),
                                                      child: Text(state.orderModel!.data![index].status_ar!,
                                                        style: TextStyle(
                                                            fontSize: 11.sp,
                                                            color: LightThemeColors.backgroundColor,
                                                            fontFamily: "Nahdi",
                                                            fontWeight: FontWeight.w900
                                                        ),
                                                        textAlign: TextAlign.center,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ) ,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff6AC52D),
                                                      borderRadius: BorderRadiusDirectional.circular(25),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:  EdgeInsets.symmetric(
                                                        horizontal: 12.w
                                                    ),
                                                    child: Icon(Icons.arrow_forward_ios,
                                                      size: 17.w,

                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 25.h,
                                ),
                              ],
                            ),
                          );
                        else if(state.orderModel!.data![index].status=='canceled')
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OrderState(
                                  state: state.orderModel!.data![index].status_ar!,
                                  id: state.orderModel!.data![index].id!,
                                  date: format.format(state.orderModel!.data![index].created_at!),
                                )),
                              );
                            },
                            onLongPress: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => OrderDetails(
                                  data: state.orderModel!.data![index],
                                )),
                              );

                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 12.w
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text('رقم الطلب'+'  '+state.orderModel!.data![index].id.toString(),
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: LightThemeColors.darkBackgroundColor,
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.h,),
                                            Row(
                                              children: [
                                                Text('تاريخ الطلب'+'     '+format.format(state.orderModel!.data![index].created_at!),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: LightThemeColors.darkBackgroundColor,
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 16.h,),
                                            Row(
                                              children: [

                                                InkWell(
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => OrderDetails(
                                                        data: state.orderModel!.data![index],
                                                      )),
                                                    );
                                                  },
                                                  child: Text('تفاصيل الطلب'
                                                    ,
                                                    style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color:   Color(0xff2D9CC5),
                                                      fontFamily: "Nahdi",
                                                      fontWeight: FontWeight.w900,

                                                    ),
                                                    textAlign: TextAlign.start,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                )

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:  EdgeInsets.only(left: 12.w),
                                          child: Column(

                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: ScreenUtil().screenWidth*0.37,
                                                    child:Padding(
                                                      padding:  EdgeInsets.symmetric(

                                                          vertical: 6.h

                                                      ),
                                                      child: Text(state.orderModel!.data![index].status_ar!,
                                                        style: TextStyle(
                                                            fontSize: 11.sp,
                                                            color: LightThemeColors.backgroundColor,
                                                            fontFamily: "Nahdi",
                                                            fontWeight: FontWeight.w900
                                                        ),
                                                        textAlign: TextAlign.center,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                    ) ,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xffC5502D),
                                                      borderRadius: BorderRadiusDirectional.circular(25),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 8.h,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text('عملية الدفع غير صحيحة',
                                                    style: TextStyle(
                                                        fontSize: 11.sp,
                                                        color: LightThemeColors.primaryColor,
                                                        fontFamily: "Nahdi",
                                                        fontWeight: FontWeight.w900
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  Padding(
                                                    padding:  EdgeInsets.symmetric(
                                                        horizontal: 12.w
                                                    ),
                                                    child: Icon(Icons.arrow_forward_ios,
                                                      size: 17.w,

                                                    ),
                                                  ),

                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 25.h,
                                ),
                              ],
                            ),
                          );
                        else
                          return SizedBox();
                      },
                    ),

                    SizedBox(height: 10.h,),



                    SizedBox(height: 30.h,),

                  ],
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
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
