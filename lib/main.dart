import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'Preference.dart';
import 'features/Screen/basket/model/addition.dart';
import 'features/Screen/basket/model/basket.dart';
import 'injection.dart' as di ;
import 'features/Screen/splash/splash_screen.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();
  await Preferences.init();
  Firebase.initializeApp();


  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(BasketAdapter());
  Hive.registerAdapter(AdditionAdapter());
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {

    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {

    }
  }
  var locale;
  print(Platform.operatingSystemVersion);
  if(Platform.localeName.substring(0,2)=='ar')
  {
    locale=Locale('ar', 'AR');
  }
  else{
    locale=Locale('ar', 'AR');
    //locale=Locale('en', 'US');
  }
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((value) {
    runApp(
        EasyLocalization(
            supportedLocales: [
              Locale('en', 'US'),
              Locale('ar', 'AR')
            ],
            path: 'assets/translations',
            saveLocale: true,
            fallbackLocale:locale ,
            child: MyApp()
        )
    );
  });


}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(420, 790),
      builder: () =>  MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Golden Cleaver',
        theme: ThemeData(
          fontFamily: 'Noto',
          primarySwatch: Colors.grey,
        ),

        home:SplashScreen(),
      ),
    );
  }
}
