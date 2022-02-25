import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/MyBankBloc.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/myBank_state.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'package:golden_cleaver/features/Screen/succ_screen/succ_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class BankTransfer extends StatefulWidget {
  MyBankBloc bloc;
  BankTransfer({Key? key,required this.bloc}) : super(key: key);

  @override
  _BankTransferState createState() => _BankTransferState();
}

class _BankTransferState extends State<BankTransfer> {
  String? bankName ="";
  bool show = false;
  TextEditingController name=TextEditingController();
  TextEditingController number=TextEditingController();
  File? transferImage;
  int id=0;
  var picker = ImagePicker();


  Future<void> getImage() async {
    final pickerFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickerFile != null) {
      transferImage = File(pickerFile.path);
      widget.bloc.onChangeImageEvent(File(pickerFile.path));
      setState(() {
      });
    }
    else {
      print('No Image Selected');

    }
  }

  @override
  void initState() {

    widget.bloc.onMyBankGetEvent();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyBankBloc, MyBankState>(
      bloc: widget.bloc,
      listener: (context, state) {
        if(state.errorMessage!.length>0)
          {
            Fluttertoast.showToast(
                msg: state.errorMessage!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0.sp
            );

          }
        if(state.cartResModel!.status!)
        {


          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => SuccScreen()));
        }
      },
      builder: (context, state) {

        return SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: state.isLoadingOrder!,
            child: Scaffold(
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: LightThemeColors.darkBackgroundColor,
                              size: 22.w,
                            ),
                          ),
                          Text(
                            ' غولدن كليفر',
                            style: TextStyle(
                                fontSize: 19.sp,
                                color: LightThemeColors.primaryColor,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900),
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
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0.h, horizontal: 28.w),
                                child: Row(
                                  children: [
                                    Text(
                                      'التحويل البنكي',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: LightThemeColors
                                              .darkBackgroundColor,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900),
                                      textAlign: TextAlign.start,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.0.h, horizontal: 28.w),
                                child: Row(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.0.h, horizontal: 4.w),
                                        child: Text(
                                          'الحسابات  البنكية',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: LightThemeColors
                                                  .lightGreyShade400,
                                              fontFamily: "Nahdi",
                                              fontWeight: FontWeight.w900),
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
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

                      Column(
                        children: [
                          for(var ban in state.myBankModel!.data!)
                          Column(
                            children: [
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 90.h,
                                      child:
                                      Image.asset('assets/images/transfer1.jpg')),
                                  SizedBox(
                                    width: 30.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        ban.bank_name!,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: LightThemeColors.lightGreyShade400,
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        ban.user_name!,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: LightThemeColors.lightGreyShade400,
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        ban.account_num!,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: LightThemeColors.lightGreyShade400,
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                        'Iban:'+ban.Iban!,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: LightThemeColors.lightGreyShade400,
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: ScreenUtil().screenWidth,
                                child: Divider(
                                  thickness: 1,
                                  color: LightThemeColors.lightGreyShade400,
                                ),
                              ),
                            ],
                          ),


                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Container(
                              width: 0.7.sw,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: LightThemeColors.darkBackgroundColor,
                                    width: 1.6),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.0.h, horizontal: 4.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        'المجموع',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: LightThemeColors
                                                .darkBackgroundColor,
                                            fontFamily: 'Nahdi',
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.end,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        (double.tryParse( state.totalWithVat!)!+state.deliveryPrice!).toString() + ' ' + ' ر.س',
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: Color(0xffFF0000),
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            width: 0.9.sw,
                            child: Padding(
                              padding: EdgeInsets.all(16.w),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 0.8.sw,
                                            child: TextField(
                                              controller: name,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  height: 0.7.h,
                                                  color: Colors.black),
                                              maxLines: 1,
                                              decoration:  InputDecoration(
                                                hintText: 'الاسم',
                                                hintStyle: TextStyle(
                                                    fontSize: 13.sp,
                                                    height: 0.7.h,
                                                    color: LightThemeColors
                                                        .lightGreyShade400),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: LightThemeColors
                                                            .primaryColor,
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(2)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: LightThemeColors
                                                            .darkBackgroundColor,
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(2)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: LightThemeColors.darkBackgroundColor
                                                  ,width: 1.5
                                            )
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                                          height: 45.h,
                                          width: 0.8.sw,
                                          child: Row(
                                            children: [
                                              Text(bankName!),
                                              Expanded(child: SizedBox(),),
                                              Icon(Icons.arrow_drop_down)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 0.8.sw,
                                            child: TextField(
                                              controller: number,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  height: 0.7.h,
                                                  color: Colors.black),
                                              maxLines: 1,
                                              decoration:  InputDecoration(
                                                hintText: 'ادخل رقم الحساب',
                                                hintStyle: TextStyle(
                                                    fontSize: 13.sp,
                                                    height: 0.7.h,
                                                    color: LightThemeColors
                                                        .lightGreyShade400),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: LightThemeColors
                                                            .primaryColor,
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(2)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: LightThemeColors
                                                            .darkBackgroundColor,
                                                        width: 2.0),
                                                    borderRadius:
                                                        BorderRadius.circular(2)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),

                                    ],
                                  ),
                                  show
                                      ? Positioned(
                                    bottom: 40.h,
                                        child: Column(
                                            children: [
                                              SizedBox(
                                                width: 0.8.sw,

                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                    physics: NeverScrollableScrollPhysics(),
                                                    itemCount: state.myBankModel!.data!.length,
                                                    itemBuilder: (ctx, index) {
                                                      return InkWell(
                                                          onTap: () {

                                                            setState(() {
                                                              bankName = state
                                                                  .myBankModel!
                                                                  .data![index]
                                                                  .bank_name!;
                                                              show = false;

                                                            });
                                                          },
                                                          child: Container(
                                                              width: 0.8.sw,
                                                              padding:
                                                              EdgeInsets.symmetric(horizontal:10.w ),
                                                              color: LightThemeColors
                                                                  .lightGreyShade200,
                                                              height: 35.h,
                                                              child: Text(
                                                                  "${state.myBankModel!.data!.length > 0 ? state.myBankModel!.data![index].bank_name : ''}")));
                                                    }),
                                              ),

                                            ],
                                          ),
                                      )
                                      : Container(),
                                ],
                              ),
                            ),
                          ),
                          transferImage!=null?
                            GestureDetector(
                              onTap: (){
                                getImage();
                              },
                              child: Container(
                                width: 0.8.sw,
                                height: 200.h,
                                child: Image.file(transferImage!,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ):
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 0.8.sw,
                                child: TextField(

                                  readOnly: true,
                                  onTap: (){
                                    getImage();
                                  },
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      height: 0.7.h,
                                      color: Colors.black),
                                  maxLines: 1,
                                  decoration:  InputDecoration(
                                    hintText: 'ارفاق الايصال',
                                    hintStyle: TextStyle(
                                        fontSize: 13.sp,
                                        height: 0.7.h,
                                        color: LightThemeColors
                                            .lightGreyShade400),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: LightThemeColors
                                                .primaryColor,
                                            width: 2.0),
                                        borderRadius:
                                        BorderRadius.circular(2)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: LightThemeColors
                                                .darkBackgroundColor,
                                            width: 2.0),
                                        borderRadius:
                                        BorderRadius.circular(2)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                            color: LightThemeColors.darkBackgroundColor,
                            disabledColor: LightThemeColors.lightGreyShade400,
                            onPressed:bankName!.length>0&&transferImage!=null&&name.text.length>0&&number.text.length>0? () {
                              widget.bloc.onChangeBankEvent
                                (name.text,
                                  number.text,
                                      id.toString()
                              );
                              widget.bloc.onOrderEvent();


                            }:null,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 85.w, vertical: 8.h),
                              child: Text(
                                'ارسال',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: LightThemeColors.backgroundColor,
                                    fontFamily: "Nahdi",
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                        ],
                      ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }


}

