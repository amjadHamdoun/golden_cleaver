import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:golden_cleaver/Globals.dart';
import 'package:golden_cleaver/core/utils/light_theme_colors.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/MyBankBloc.dart';
import 'package:golden_cleaver/features/Screen/bank_transfer/bloc/myBank_state.dart';
import 'package:golden_cleaver/features/Screen/payment_type/payment_type.dart';
import 'package:golden_cleaver/injection.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class AddAddress extends StatefulWidget {
  MyBankBloc bloc = sl<MyBankBloc>();
   AddAddress({Key? key,required this.bloc}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress>   {

  bool show=false;
  bool showSection=false;
  Completer<GoogleMapController> _controller = Completer();
  LatLng center =  LatLng(21.437273, 40.512714);
  Map<MarkerId, Marker> markers = {};



  @override
  void initState() {
    print(Global.userToken);
    widget.bloc.onResetEvent();
    MarkerId markerId = MarkerId('orgin');
    Marker marker =
    Marker(markerId: markerId,
        icon: BitmapDescriptor.defaultMarker ,
        position: center);
    markers[markerId] = marker;
    widget.bloc.onGetCitiesEvent();
    widget.bloc.onGetSectionsEvent();
    super.initState();
  }


  @override
  Widget build(context) {
    return BlocConsumer<MyBankBloc, MyBankState>(
      bloc: widget.bloc,
      listener: (context, state) async {

      },
      builder: (context, state) {
        print(state);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 25.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 12.w
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
                          width: 22.w,
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
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                        horizontal: 25.w
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 22.w,
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 12.w),
                          child: Container(


                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: 5.0.h
                                  ,horizontal: 4.w
                              ),
                              child: Text('موقع التسليم',
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
                        Container(
                          width: 22.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: LightThemeColors.darkBackgroundColor,

                          ),
                          child: Icon(
                            Icons.close,
                            color: LightThemeColors.backgroundColor,
                          ),
                        ),


                      ],
                    ),
                  ),

                  SizedBox(height: 10.h,),
                  Container(
                    width: 0.75.sw,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: LightThemeColors.darkBackgroundColor
                      ),
                    ),
                    child:Padding(
                      padding:  EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 13.h
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset("assets/icons/map-marker.svg"),
                          Text('اضف عنوان التسليم',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: LightThemeColors.darkBackgroundColor,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          SvgPicture.asset("assets/icons/plus_icon.svg",
                            width: 17.w,
                          ),
                        ],
                      ),
                    ) ,
                  ),
                  SizedBox(height: 10.h,),
                  SizedBox(
                    height: 299.h,
                    width: ScreenUtil().screenWidth - 40,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      tiltGesturesEnabled: true,
                      compassEnabled: true,
                      myLocationButtonEnabled: true,
                      scrollGesturesEnabled: true,
                      zoomGesturesEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                      markers: Set<Marker>.of(markers.values),
                      gestureRecognizers: Set()
                        ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                        ..add(Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()))
                        ..add(Factory<TapGestureRecognizer>(() => TapGestureRecognizer()))
                        ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
                      onTap: (latAndLon){
                        print(latAndLon);
                        MarkerId markerId = MarkerId('orgin');
                        Marker marker =
                        Marker(markerId: markerId,
                            icon: BitmapDescriptor.defaultMarker ,
                            position: latAndLon);
                        markers[markerId] = marker;
                        widget.bloc.onChangeLatLonEvent(
                            latAndLon.latitude,
                            latAndLon.longitude);

                        setState(() {

                        });
                      },
                      initialCameraPosition: CameraPosition(
                        target: state.center!,
                        zoom: 15,
                      ),
                      zoomControlsEnabled: true,
                    ),
                  ),




                  SizedBox(height: 10.h,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        show=true;
                      });
                    },
                    child: Container(
                      width: 0.75.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: LightThemeColors.darkBackgroundColor
                        ),
                      ),
                      child:Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10.w,),
                            Text(state.cityName!.length>0?
                            state.cityName!:
                            'اختر المدينة',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: LightThemeColors.darkBackgroundColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down,size: 27.w,),
                          ],
                        ),
                      ) ,
                    ),
                  ),
                  if(show)
                    SizedBox(
                      width: 0.8.sw,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.cityModel!.data!.length,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                                onTap: () {
                                  widget.bloc.onChangeCityEvent(state.cityModel!.data![index].id!,
                                      state.cityModel!.data![index].name!,
                                      state.cityModel!.data![index].delivery_price!
                                  );
                                  setState(() {
                                    show = false;

                                  });
                                },
                                child: Container(
                                    width: 0.8.sw,
                                    padding:
                                    EdgeInsets.symmetric(horizontal:10.w,
                                        vertical: 8.h
                                    ),
                                    color: LightThemeColors
                                        .lightGreyShade200,

                                    child: Text(
                                      "${state.cityModel!.data!.length > 0 ? state.cityModel!.data![index].name
                                          : ''
                                      }",
                                      style: TextStyle(
                                          fontSize: 16.sp
                                      ),
                                    )));
                          }),
                    ),

                  SizedBox(height: 10.h,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        showSection=true;
                      });
                    },
                    child: Container(
                      width: 0.75.sw,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: LightThemeColors.darkBackgroundColor
                        ),
                      ),
                      child:Padding(
                        padding:  EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: 10.w,),
                            Text(state.sectionName!.length>0?
                            state.sectionName!:
                            'اختر الحي',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: LightThemeColors.darkBackgroundColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down,size: 27.w,),
                          ],
                        ),
                      ) ,
                    ),
                  ),
                  if(showSection)
                    SizedBox(
                      width: 0.8.sw,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.sectionModel!.data!.length,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                                onTap: () {
                                  widget.bloc.onChangeSectionEvent(
                                      state.sectionModel!.data![index].id!,
                                      state.sectionModel!.data![index].name!);

                                  setState(() {
                                    showSection = false;

                                  });
                                },
                                child: Container(
                                    width: 0.8.sw,
                                    padding:
                                    EdgeInsets.symmetric(horizontal:10.w,
                                        vertical: 8.h
                                    ),
                                    color: LightThemeColors
                                        .lightGreyShade200,

                                    child: Text(
                                      "${state.sectionModel!.data!.length > 0 ? state.sectionModel!.data![index].name
                                          : ''
                                      }",
                                      style: TextStyle(
                                          fontSize: 16.sp
                                      ),
                                    )));
                          }),
                    ),

                  SizedBox(height: 10.h,),



                  SizedBox(height: 30.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(' المنزل',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: LightThemeColors.darkBackgroundColor,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 0.35.sw,

                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                onChanged: (va){
                                  widget.bloc.onChangeHomeEvent(va);
                                },
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    height: 0.7.h,
                                    color: Colors.black
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,

                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  hintText: 'المنزل',
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      Column(
                        children: [
                          Text(' الشارع',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: LightThemeColors.darkBackgroundColor,
                                fontFamily: "Nahdi",
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: 0.35.sw,

                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(
                                onChanged: (va){
                                  widget.bloc.onChangStreetEvent(va);
                                },
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    height: 0.7.h,
                                    color: Colors.black
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 1,

                                decoration: new InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                      borderRadius: BorderRadius.circular(12)
                                  ),
                                  hintText: ' الشارع',
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 35.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('وصف اختياري',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: LightThemeColors.darkBackgroundColor,
                                  fontFamily: "Nahdi",
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 0.8.sw,
                          child: TextField(
                            onChanged: (va){
                              widget.bloc.onChangeDescEvent(va);
                            },
                            style: TextStyle(
                                fontSize: 15.sp,
                                height: 0.7.h,
                                color: Colors.black
                            ),

                            maxLines: 5,

                            decoration:  InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: LightThemeColors.primaryColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(12)
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: LightThemeColors.darkBackgroundColor, width: 2.0),
                                  borderRadius: BorderRadius.circular(12)
                              ),

                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  MaterialButton(
                    disabledColor: LightThemeColors.lightGreyShade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    color: LightThemeColors.darkBackgroundColor,
                    onPressed:state.lat!>0&&state.cityId!>0&&state.sectionId!>0? (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentType(
                          bloc: widget.bloc,
                        )),
                      );
                    }:null,

                    child:  Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 85.w,
                          vertical: 8.h
                      ),
                      child: Text('استمرار',
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
              ),
            ),
          ),
        );
      },
    );
  }


}
