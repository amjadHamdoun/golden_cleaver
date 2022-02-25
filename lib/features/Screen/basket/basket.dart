import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/add_address/add_address.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/MyBankBloc.dart';
import 'package:golden_cleaver/features/Screen/mainlog/mainlogscreen.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';
import 'package:golden_cleaver/injection.dart';


class BasketScreen extends StatefulWidget {

  
  PagesBloc bloc;
  BasketScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  _BasketScreenState createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen>  {
  MyBankBloc blocBank = sl<MyBankBloc>();
  double total=0;
  double taxAmount=0;


  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(context) {
    return BlocConsumer<PagesBloc, PagesState>(
      bloc: widget.bloc,
      listener: (context, state) {

      },
      builder: (context, state) {
        if(state.carts!.length>0)
          {
            total=0;
            for(var ca in state.carts!)
              {
                total+=ca.price!;
              }
            taxAmount=(total*(Global.tax!/100)).floorToDouble();

          }
        else{
          total=0;
          taxAmount=0;
        }

        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child:Global.userToken!.length>1?
                  state.carts!.length>0?
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
                            child: Text('سلة التسوق',
                              style: TextStyle(
                                  fontSize: 19.sp,
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



                  SizedBox(height: 10.h,),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.carts!.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(
                                horizontal: 12.w
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: state.carts![index].image!,

                                  imageBuilder: (context, imageProvider) => Container(
                                    height: 80.h,
                                    width: ScreenUtil().screenWidth*0.33,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fill,
                                        )

                                      ),
                                  ),
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Column(

                                    children: [
                                      Text(state.carts![index].name!,
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: LightThemeColors.primaryColor,
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8.h,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(state.carts![index].sizeName!+'   '+'('+state.carts![index].sizePrice.toString()+')',
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: LightThemeColors.primaryColor,
                                                fontFamily: "Nahdi",
                                                fontWeight: FontWeight.w900
                                            ),
                                            textAlign: TextAlign.center,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 8.h,),
                                      for(int i=0;i<state.carts![index].additions.length;i++)
                                      Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(state.carts![index].additions[i].name!+'   '
                                                  +'('+state.carts![index].additions[i].price!.toString()+')',
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: LightThemeColors.darkBackgroundColor,
                                                    fontFamily: "Nahdi",
                                                    fontWeight: FontWeight.w900
                                                ),
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8.h,),
                                        ],
                                      ),


                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                state.carts![index].amount=
                                                    state.carts![index].amount!+1;
                                                state.carts![index].price=
                                                    state.carts![index].amount!*
                                                        state.carts![index].priceWithAddition!;
                                              });
                                              widget.bloc.onSetCartsEvent(state.carts!);

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Color(0xffEDDDB5),
                                                      width: 2
                                                  )
                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.all(8.0),
                                                child:  SvgPicture.asset('assets/icons/plus_icon.svg',
                                                  color: LightThemeColors.darkBackgroundColor,

                                                  width: 10.w,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          Container(
                                            width: ScreenUtil().screenWidth*0.20,
                                            decoration: BoxDecoration(
                                                color: Color(0xffEDDDB5
                                                ),
                                                borderRadius: BorderRadius.circular(20)),
                                            child: Padding(
                                              padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                                  ,horizontal: 4.w
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(state.carts![index].amount.toString(),
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: LightThemeColors.darkBackgroundColor,
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
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          GestureDetector(
                                            onTap: (){
                                              setState(() {
                                                if(state.carts![index].amount!>1)
                                                  {
                                                    state.carts![index].amount=
                                                        state.carts![index].amount!-1;
                                                    state.carts![index].price=
                                                        state.carts![index].amount!*
                                                            state.carts![index].priceWithAddition!;

                                                  }
                                                widget.bloc.onSetCartsEvent(state.carts!);

                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Color(0xffEDDDB5),
                                                      width: 2
                                                  )
                                              ),
                                              child: Padding(
                                                padding:  EdgeInsets.all(8.0),
                                                child:  SvgPicture.asset('assets/icons/minus.svg',
                                                  color: LightThemeColors.darkBackgroundColor,
                                                  width: 10.w,
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Text(state.carts![index].price.toString()+' '+'ر.س',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: LightThemeColors.primaryColor,
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 8.h,),
                                      GestureDetector(
                                        onTap: (){
                                          state.carts!.removeAt(index);
                                          setState(() {

                                          });
                                          widget.bloc.onSetCartsEvent(state.carts!);
                                        },
                                        child: SvgPicture.asset('assets/icons/delete.svg',
                                          color: LightThemeColors.lightGreyShade400,
                                          width: 22.w,

                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().screenWidth,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 12.w),
                              child: Divider(
                                thickness:1,
                                color: LightThemeColors.lightGreyShade400,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      );
                    },
                  ),

                  SizedBox(height: 10.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 7.w
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text('ضريبة القيمة االمضافة',
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
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: Text(taxAmount.toString()+' '+'ر.س',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xffFF0000),
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
                  SizedBox(height: 10.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 7.w
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text('المجموع',
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
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: Text((total+taxAmount).toString()+' '+'ر.س',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xffFF0000),
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
                  SizedBox(height: 10.h,),
                  MaterialButton(
                     disabledColor: LightThemeColors.lightGreyShade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: LightThemeColors.darkBackgroundColor,
                    onPressed:total>0? (){
                      blocBank.onGetMyLocationEvent();
                      blocBank.onChangeTotalEvent(total.toString(), (total+taxAmount).toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddAddress(
                          bloc: blocBank,
                        )),
                      );
                    }:null,

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


                  SizedBox(height: 30.h,),

                ],
              ):
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
                            Text('لا يوجد منتجات بالسلة',
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
              )
              ,
            ),
          ),
        );
      },
    );
  }

}
