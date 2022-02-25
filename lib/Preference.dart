import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static SharedPreferences? preferences;
  static const String KEY_IS_First_Time = 'key_is_first_time';

  static const String KEY_UserToken = 'key_UserToken';


  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static void saveIsFirstTime(bool isFirstTime) async {
    preferences!.setBool(KEY_IS_First_Time, isFirstTime);

  }
  static bool? getIsFirstTime() {
    bool? first = preferences!.getBool(KEY_IS_First_Time);
    if(first==null)
    {
      return true;
    }
    else
      return first;
  }

  static void saveUserToken(String userToken) async {
    preferences!.setString(KEY_UserToken, userToken);
  }

  static String? getUserToken() {
    String? userToken = preferences!.getString(KEY_UserToken);
     if(userToken==null)
       {
         return '';
       }
     else
    return userToken;
  }


}
