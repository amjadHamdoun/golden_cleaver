
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:golden_cleaver/core/utils/light_theme_colors.dart';


import 'package:golden_cleaver/features/Screen/MyAccount/model/notification/notification_model.dart';
class Notifications extends StatefulWidget {


  NotificationModel notificationModel;
   Notifications({Key? key,required this.notificationModel}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
              SizedBox(height: 20.h,),

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
                   SizedBox(
                     width: 30.w,
                   ),
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.notificationModel.data!.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 5.0.h
                      ,horizontal: 2.w
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(

                        height:70.h,
                        width: 0.9.sw,
                        decoration: BoxDecoration(
                          color: LightThemeColors.lightGreyShade200,
                          borderRadius: BorderRadius.circular(10),

                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.notifications,color: LightThemeColors.secondColor,),
                                  Text(widget.notificationModel.data![index].content!,
                                    style: TextStyle(
                                        fontSize: 14.sp,

                                        color: LightThemeColors.secondColor,
                                        fontFamily: "Noto",

                                        fontWeight: FontWeight.w500
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('12/12/2021',

                                    style: TextStyle(
                                        fontSize: 12.sp,

                                        color: LightThemeColors.primaryColor,
                                        fontFamily: "Noto",

                                        fontWeight: FontWeight.w500
                                    ),
                                    textAlign: TextAlign.start,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Icon(Icons.delete,color: LightThemeColors.primaryColor,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },)


            ],
          ),
        ),
      ),
    );
  }
}
