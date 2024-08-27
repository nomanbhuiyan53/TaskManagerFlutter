import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasksystem/data/models/UserModel.dart';

class AuthController{
  static String accessToken ='';

   static Future<void> saveAccessToken(String token) async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     await sharedPreferences.setString('access_token', token);
     accessToken = token;
   }

   static Future<String> getAccessToken() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     accessToken = sharedPreferences.getString('access_token') ?? '';
     return accessToken;
   }

   static Future<void> saveUser(UserModel user) async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     await sharedPreferences.setString('user', jsonEncode(user.toJson()));
   }

   static Future<UserModel?> getUser() async {
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     String? data = sharedPreferences.getString('user');
     if(data == null) return null;
     UserModel userInfo = UserModel.fromJson(jsonDecode(data));
     return userInfo;
   }


}