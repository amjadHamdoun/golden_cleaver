import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/MyAccount/MyAccount.dart';
import 'package:golden_cleaver/features/Screen/basket/basket.dart';
import 'package:golden_cleaver/features/Screen/category/category.dart';
import 'package:golden_cleaver/features/Screen/home/home.dart';
import 'package:golden_cleaver/features/Screen/orders/orders.dart';
import 'package:golden_cleaver/features/Screen/pages/bloc/PagesBloc.dart';
import 'package:golden_cleaver/injection.dart';

import 'bloc/pages_state.dart';


class Pages extends StatefulWidget {
  int pageNumber;
  bool restCart;

  Pages({
    Key? key,
    required this.pageNumber,
    required this.restCart
  }) : super(key: key);


  @override
  _PagesState createState() =>
      _PagesState();

}

class _PagesState extends State<Pages> with SingleTickerProviderStateMixin {
  late int select;
  late PageController controller;
  PagesBloc bloc = sl<PagesBloc>();

  @override
  void initState() {
    select = widget.pageNumber;
    controller = PageController(initialPage: select);
    if(widget.restCart)
      bloc.onSetCartsEvent([]);
    bloc.onGetCartsEvent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PagesBloc, PagesState>(
      bloc: bloc,
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            controller: controller,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Home(
                bloc: bloc,
               press: () {
                 controller.jumpToPage(1);
                 select=1;
                 setState(() {

                 });
               },
              ),
              // Category(
              //   bloc: bloc,
              // ),
              Orders(
                bloc: bloc,
              ),
              BasketScreen(
                bloc: bloc,
              ),
              MyAccount(
                bloc: bloc,
                goMyOrders: (){
                  controller.jumpToPage(1);
                  select = 1;
                  setState(() {

                  });
                },
              ),


            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: select,
            showUnselectedLabels: true,
            onTap: (int index) {
              select = index;
              controller.jumpToPage(index);
              setState(() {

              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/house-damage.svg',
                    color: select == 0 ? LightThemeColors.primaryColor :
                    LightThemeColors.lightGreyShade400,
                  ),
                  title: Text('الرئيسية',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: select == 0 ? LightThemeColors.primaryColor :
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
                    color: select == 1 ? LightThemeColors.primaryColor :
                    LightThemeColors.lightGreyShade400,
                  ),
                  title: Text('طلباتي',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: select == 1 ? LightThemeColors.primaryColor :
                      LightThemeColors.lightGreyShade400,
                    ),
                  )

              ),
              BottomNavigationBarItem(
                  icon: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset('assets/icons/shopping-basket.svg',
                        color: select == 2 ? LightThemeColors.primaryColor :
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
                            color: select == 2 ? LightThemeColors.primaryColor :
                            LightThemeColors.lightGreyShade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text('السلة',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: select ==2 ? LightThemeColors.primaryColor :
                      LightThemeColors.lightGreyShade400,
                    ),
                  )

              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/user-circle.svg',
                    color: select == 3 ? LightThemeColors.primaryColor :
                    LightThemeColors.lightGreyShade400,
                  ),
                  title: Text('حسابي',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: select == 3 ? LightThemeColors.primaryColor :
                      LightThemeColors.lightGreyShade400,
                    ),
                  )

              ),
            ],
          ),
        );
      },
    );
  }
}
