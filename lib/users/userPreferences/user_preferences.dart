import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_pakaian_flutter_app/users/model/user.dart';

class RememberUserPrefs
{
  // save-remmember User-info
  static Future<void> storeUserInfo(User userInfo) async
  {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData = jsonEncode(userInfo.toJson());
    await preferences.setString("currentUser", userJsonData);
  }

  // get-read User-info
 static Future<User?> readUserInfo() async
 {
   User? currentUserInfo;
   SharedPreferences preferences = await SharedPreferences.getInstance();
   String? userInfo = preferences.getString("currentUser");
   if(userInfo != null)
     {
       Map<String, dynamic> userDataMap = jsonDecode(userInfo);
       currentUserInfo = User.fromJson(userDataMap);
     }
   return currentUserInfo;
 }

 static Future<void> removedUserInfo() async
 {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   await preferences.remove("currentUser");
 }

}