import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/basket/model/addition.dart';
import 'package:golden_cleaver/features/Screen/basket/model/basket.dart';
import 'package:golden_cleaver/features/Screen/home/model/product/data.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/pages_state.dart';
import 'package:golden_cleaver/features/Screen/pages/pages.dart';



class ItemDetails extends StatefulWidget {
  Data productModel;
  PagesBloc bloc;


   ItemDetails({Key? key,
     required this.productModel,
     required this.bloc,

   }) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {

  List<bool> selected=[];
  int selectSize=0;
  String formattedDate = DateFormat('yyyy-MM-dd','en').format((DateTime.now()));
  late Basket cart;

  @override
  void initState() {
    for(int i=0;i<widget.productModel.additions.length;i++)
    {
      selected.add(false);
    }
    cart=Basket(
      amount: 1,
      id: widget.productModel.id,
      price: widget.productModel.sizes.length>0?
      widget.productModel.sizes[0].price:0,
      size_id: widget.productModel.sizes.length>0?
      widget.productModel.sizes[0].id:0,
      priceWithAddition: widget.productModel.sizes.length>0?
      widget.productModel.sizes[0].price:0,
      image: widget.productModel.image,
      name: widget.productModel.name,
      additions: [],
      sizeName: widget.productModel.sizes.length>0?
      widget.productModel.sizes[0].name:'',
      sizePrice: widget.productModel.sizes.length>0?
      widget.productModel.sizes[0].price:0,
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
                    Text(' غولدن كليفر',
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
                      SizedBox(),
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
                            child: Text('اختر   الحجم',
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
                  gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 4.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: widget.productModel.sizes.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 12.w),
                      child: GestureDetector(
                        onTap: (){
                            selectSize=index;
                            cart.size_id=widget.productModel.sizes[index].id;
                            cart.sizeName=widget.productModel.sizes[index].name;
                            cart.priceWithAddition=widget.productModel.sizes[index].price;
                            cart.sizePrice=widget.productModel.sizes[index].price;
                            for(var add in cart.additions)
                              {
                                cart.priceWithAddition=cart.priceWithAddition!+add.price!;
                              }
                            cart.price=cart.priceWithAddition!*cart.amount!;
                            setState(() {

                            });
                        },
                        child: Container(
                          width: ScreenUtil().screenWidth/2,
                          decoration: BoxDecoration(
                              border:selectSize==index? Border.all(
                                color:

                                Color(0xffEAA947
                                ),):Border(),
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 2.0.h
                                ,horizontal: 4.w
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(widget.productModel.sizes[index].name!,
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
                                Text(widget.productModel.sizes[index].price!.toString() +" "+'ر.س',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Color(0xffFF0000),
                                      fontFamily: "Nahdi",
                                      fontWeight: FontWeight.w900
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              SizedBox(height: 20.h,),
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
                                child: Text('يتعين عليك اختيار الخدمات المرفقة',
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
                                child: Text(widget.productModel.additions[index].price.toString()+' '+'ر.س',
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
              if(widget.productModel.content!=null)
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
                            child: Text('التفاصيل',
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
                          child: Text(widget.productModel.content!,
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
                        price: widget.productModel.sizes.length>0?
                        widget.productModel.sizes[0].price:0,
                        size_id: widget.productModel.sizes.length>0?
                        widget.productModel.sizes[0].id:0,
                        priceWithAddition: widget.productModel.sizes.length>0?
                        widget.productModel.sizes[0].price:0,
                        image: widget.productModel.image,
                        name: widget.productModel.name,
                        additions: [],
                        sizeName: widget.productModel.sizes.length>0?
                        widget.productModel.sizes[0].name:'',
                        sizePrice: widget.productModel.sizes.length>0?
                        widget.productModel.sizes[0].price:0,
                        addition_id: []


                      );
                      for(int i=0;i<selected.length;i++)
                        {
                          selected[i]=false;
                        }
                      selectSize=0;
                      setState(() {

                      });
                    }
                  else
                    {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'فشل الاضافة',
                        desc: "يجب تسجيل الدخول اولا",
                        btnCancelText: 'حسنا',
                        btnCancelOnPress: () {},
                      )..show();

                      }

                },

                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 65.w,
                  vertical: 8.h
                  ),
                  child: Text('اضف للسلة',
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
                        child: Text('التعليقات',
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
              SizedBox(height: 10.h,),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
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
                                  Text('عبد الله الخالدي',
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

                              Text(formattedDate,
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
                                  padding:  EdgeInsets.only(bottom: 37.h,right: 3.w,
                                  top: 4.h
                                  ),
                                  child: Text('  متجر رائع  جد  ',
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
