import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/model/data.dart';
import 'package:golden_cleaver/features/Screen/basket/model/addition.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket.dart';
import 'package:golden_cleaver/features/Screen/category/model/comment_model.dart';
import 'package:golden_cleaver/features/Screen/category/model/product_model.dart';
import 'package:golden_cleaver/features/Screen/category/model/size_model.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';
import 'dart:ui' as ui;

import '../../../Preference.dart';


class ItemDetailsWithSizes extends StatefulWidget {

  ProductModel productModel;
  SizeModel sizeModel;
  PagesBloc bloc;
  ItemDetailsWithSizes({Key? key,
     required this.productModel,
    required this.sizeModel,
     required this.bloc,

   }) : super(key: key);

  @override
  _ItemDetailsWithSizesState createState() => _ItemDetailsWithSizesState();
}

class _ItemDetailsWithSizesState extends State<ItemDetailsWithSizes> {

  List<bool> selected=[];
  String kiloValue='1';
  String grmValue='0';
  String formattedDate = DateFormat('yyyy-MM-dd','en').format(
      (DateTime.now()));
  late Basket cart;
  List<String> kilo=List.generate(100, (index) => (index+1).toString());
  List<String> grm = List.generate(20, (index) => (50*(index)).toString());
  TextEditingController textEditingController=TextEditingController();

  @override
  void initState() {


    for(int i=0;i<widget.productModel.additions.length;i++)
    {
      selected.add(false);
    }
    cart=Basket(
      amount: 1,
      id: widget.productModel.id,
      price: widget.sizeModel.price,
      size_id: widget.sizeModel.id,
      priceWithAddition: widget.sizeModel.price,
      image: widget.sizeModel.image,
      name: widget.productModel.name,
      additions: [],
      sizeName: widget.sizeModel.name,
      sizePrice:
      widget.sizeModel.price,
      addition_id: []
    );

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PagesBloc, PagesState>(
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
                    padding:  EdgeInsets.symmetric(
                        horizontal: 16.w
                    ),
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
                              fontSize: 18.sp,
                              color: LightThemeColors.primaryColor,
                              fontFamily: "Nahdi",
                              fontWeight: FontWeight.w900
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => Pages(
                                  restCart: false,
                                  pageNumber: 2,
                                ),
                              ),
                                  (route) => false,
                            );

                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              SvgPicture.asset('assets/icons/shopping-basket.svg',
                                color: LightThemeColors.darkBackgroundColor,
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
                                      shape:BoxShape.circle,
                                      color:
                                      LightThemeColors.darkBackgroundColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Stack(
                    children: [
                      Container(
                        width: ScreenUtil().screenWidth,
                        child: CachedNetworkImage(
                            imageUrl: widget.productModel.image!,
                            fit: BoxFit.fill
                        ),
                        height: 180.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.w),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              color: LightThemeColors.darkBackgroundColor,
                              disabledColor:   LightThemeColors.darkBackgroundColor,
                              onPressed: null,

                              child:  Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 15.w,
                                    vertical: 8.h
                                ),
                                child: Text(widget.sizeModel.price.toString()+' '+'??.??',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: LightThemeColors.goldenColor,
                                      fontFamily: "Nahdi",
                                      fontWeight: FontWeight.w900
                                  ),
                                  textDirection: ui.TextDirection.rtl,
                                  textAlign: TextAlign.start,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: GestureDetector(
                              onTap: (){
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Color(0xffEFBE75),
                                        width: 2
                                    )
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Icon(Icons.share,
                                    color: Color(0xffEFBE75),
                                    size: 15.w,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),


                  if(widget.productModel.additions.length>0)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: ScreenUtil().screenWidth*0.65,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xffEDDDB5
                                    ),),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                    ,horizontal: 4.w
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text('?????????? ???????? ???????????? ?????????????? ??????????????',
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


                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 10.h,),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 4.5,

                                crossAxisSpacing: 2,
                                mainAxisSpacing: 2),
                            itemCount: selected.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(

                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [

                                    Checkbox(value: selected[index],
                                        activeColor: LightThemeColors.primaryColor,
                                        onChanged: (va){
                                          selected[index]=va!;
                                          if(va){
                                            cart.addition_id.add(widget.productModel.additions[index].id!);
                                            cart.additions.add(Addition
                                              (id: widget.productModel.additions[index].id,
                                                name: widget.productModel.additions[index].name,
                                                price: widget.productModel.additions[index].price,
                                                old_price: widget.productModel.additions[index].old_price)
                                            );
                                            cart.priceWithAddition
                                            =cart.priceWithAddition!+
                                                widget.productModel.additions[index].price!;
                                            cart.price=cart.priceWithAddition!*cart.amount!;
                                          }
                                          else{
                                            cart.addition_id.remove(widget.productModel.additions[index].id!);
                                            for(int i=0;i<cart.additions.length;i++)
                                            {
                                              if(widget.productModel.additions[index].id==cart.additions[i].id)
                                              {
                                                cart.additions.removeAt(i);
                                                break;
                                              }
                                            }
                                            cart.priceWithAddition
                                            =cart.priceWithAddition!-
                                                widget.productModel.additions[index].price!;
                                            cart.price=cart.priceWithAddition!*cart.amount!;
                                          }
                                          setState(() {

                                          });
                                        }),
                                    Expanded(
                                      flex: 2,
                                      child: Text(widget.productModel.additions[index].name!,
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: LightThemeColors.darkBackgroundColor,
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900
                                        ),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(widget.productModel.additions[index].price.toString()+' '+'??.??',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            color:Color(0xffdd0000),
                                            fontFamily: "Nahdi",
                                            fontWeight: FontWeight.w900
                                        ),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),


                                  ],
                                ),

                              );
                            }),
                        SizedBox(height: 10.h,),
                      ],
                    ),
                  if(widget.sizeModel.description!=null)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 12.w),
                              child: Container(

                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: LightThemeColors.primaryColor
                                      )
                                  ),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                      ,horizontal: 4.w
                                  ),
                                  child: Text('????????????????',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: LightThemeColors.primaryColor,
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

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: ScreenUtil().screenWidth*0.8,
                              child:Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                                child: Text(widget.sizeModel.description!,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: LightThemeColors.darkBackgroundColor,


                                  ),
                                  textAlign: TextAlign.start,

                                ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                                child: Divider(
                                  color: LightThemeColors.lightGreyShade400,
                                  thickness: 2,

                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),


                  SizedBox(height: 10.h,),
                  if(widget.sizeModel.grams_enabled==1)
                    Row(
                      textDirection: ui.TextDirection.rtl,
                      children: [
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: DropdownButton(

                            isExpanded: true,



                            // Initial Value
                            value: grmValue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: grm.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Row(
                                  textDirection: ui.TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(items
                                      , style: TextStyle(
                                          fontSize: 13.sp,
                                          color: LightThemeColors.primaryColor,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text('????????',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: LightThemeColors.primaryColor,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900
                                      ),
                                      textAlign: TextAlign.center,
                                    ),


                                  ],
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (newValue) {
                              String amount='0.0';
                              setState(() {
                                grmValue = newValue.toString();
                                amount=kiloValue+'.'+grmValue;
                                cart.amount=double.tryParse(amount);
                                cart.price=cart.amount!*cart.priceWithAddition!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Expanded(
                          child: DropdownButton(
                            isExpanded: true,



                            // Initial Value
                            value: kiloValue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: kilo.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Row(
                                  textDirection: ui.TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(items
                                      , style: TextStyle(
                                          fontSize: 13.sp,
                                          color: LightThemeColors.primaryColor,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text('????????',
                                      style: TextStyle(
                                          fontSize: 13.sp,
                                          color: LightThemeColors.primaryColor,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (newValue) {
                              String amount='0.0';
                              setState(() {
                                kiloValue = newValue.toString();
                                amount=kiloValue+'.'+grmValue;
                                cart.amount=double.tryParse(amount);
                                cart.price=cart.amount!*cart.priceWithAddition!;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.w,),


                      ],
                    )else
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              cart.amount=cart.amount!+1;
                              cart.price=cart.amount!*cart.priceWithAddition!;

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
                                  child: Text(  cart.amount.toString(),
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
                              if(cart.amount!>1)
                              {
                                cart.amount=cart.amount!-1;
                                cart.price=cart.amount!*cart.priceWithAddition!;
                              }

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
                  SizedBox(height: 10.h,),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: LightThemeColors.darkBackgroundColor,
                    onPressed: (){
                      if(Global.userToken!.length>1)
                      {
                        widget.bloc.onAddCartsEvent(cart);
                        cart=Basket(
                            amount: 1,
                            id: widget.productModel.id,
                            price:
                            widget.sizeModel.price,
                            size_id:
                            widget.sizeModel.id,
                            priceWithAddition:
                            widget.sizeModel.price,
                            image: widget.sizeModel.image,
                            name: widget.productModel.name,
                            additions: [],
                            sizeName:
                            widget.sizeModel.name,
                            sizePrice:
                            widget.sizeModel.price,
                            addition_id: []


                        );
                        for(int i=0;i<selected.length;i++)
                        {
                          selected[i]=false;
                        }
                        setState(() {

                        });
                      }
                      else
                      {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: '?????? ??????????????',
                          desc: "?????? ?????????? ???????????? ????????",
                          btnCancelText: '????????',
                          btnCancelOnPress: () {},
                        )..show();

                      }

                    },

                    child:  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 65.w,
                          vertical: 8.h
                      ),
                      child: Text('?????? ??????????',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 12.w),
                        child: Container(

                          decoration: BoxDecoration(
                              border: Border.all(
                                color: LightThemeColors.primaryColor,),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                ,horizontal: 12.w
                            ),
                            child: Text('??????????????????',
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

                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textEditingController,
                      cursorColor: Colors.black,
                      style: TextStyle(
                          fontFamily: 'JF Flat',
                          fontSize: 15.sp,
                          height: 0.8.h,
                          color: Colors.black),
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: '??????????',
                        fillColor:Colors.white,
                        border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: LightThemeColors.lightGreyShade200, width: 1),
                        ),
                        hintText: '??????????',
                        hintStyle: TextStyle(

                          fontSize: 15.sp,
                          color:  Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            if(textEditingController.text.length>0)
                              {
                                widget.productModel.comments.add(
                                    CommentModel(content:
                                    textEditingController.text,
                                        user: UserData(mobile: '',
                                        email: '',
                                          name: Preferences.getUserName()
                                        ),
                                        created_at: DateTime.now())
                                );
                                setState(() {

                                });
                                widget.bloc.onAddCommentEvent(
                                    productId: widget.productModel.id!,
                                    content: textEditingController.text);
                                textEditingController.clear();
                              }

                            else
                              Fluttertoast.showToast(
                                  msg: "???????? ?????????? ??????????",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: LightThemeColors
                                      .lightGreyShade400,
                                  textColor: LightThemeColors
                                      .backgroundColor,
                                  fontSize: 15.0.sp);
                          },
                          child: Text(
                            '??????????',
                            style: TextStyle(
                              fontFamily: 'JF Flat',
                              fontSize: 18.sp,
                              color: const Color(0xffffffff),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: LightThemeColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: widget.productModel.comments.length,
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
                                Row(
                                  children: [
                                    SvgPicture.asset('assets/icons/user_comment.svg',
                                    ),
                                    Text(widget.productModel.comments[index].user!.name!,
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

                                Text(DateFormat('yyyy-MM-dd','en').format(
                                    (widget.productModel.comments[index].created_at)),
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: LightThemeColors.primaryColor,
                                      fontFamily: "Nahdi",
                                      fontWeight: FontWeight.w900
                                  ),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                                child: Container(
                                  width: ScreenUtil().screenWidth*0.9,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xffEAA947
                                        ),),
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                    padding:  EdgeInsets.only(bottom: 16.h,right: 12.w,
                                        top: 16.h,left: 12.w,
                                    ),
                                    child: Text(widget.productModel.comments[index].content!,
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          color: LightThemeColors.darkBackgroundColor,
                                          fontFamily: "Nahdi",
                                          fontWeight: FontWeight.w900
                                      ),
                                      textAlign: TextAlign.start,

                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      );
                    },
                  ),


                  SizedBox(height: 30.h,),

                ],
              ),
            ),
          ),
        );
      },
);
  }
}
