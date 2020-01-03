/*
 * @Author Bangjin Yu
 * @Email: 1227169416@qq.com
 * @Address: 梦想小镇互联网村
 * @Date 2019-12-10 21:17:09 Tuesday
 */

import 'package:shared_preferences/shared_preferences.dart';

///存储Login
setAssetsLogin(bool login) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('login', login);
}

///存储phone
setAssetsPhone(String phone) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('phone', phone);
}

///存储token
setAssetsToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}

///存储device
setAssetsDevice(String deviceToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('deviceToken', deviceToken);
}

///获取Login
Future<bool> getAssetsLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool login = prefs.getBool('login');
  return login == null ? false : login;
}

///获取Phone
Future<String> getAssetsPhone() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String phone = prefs.getString('phone');
  return phone == null ? '':phone;
}

///获取Token
Future<String> getAssetsToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token');
  return token == null ? '': token;
}

///获取Device
Future<String> getAssetsDevice() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String deviceToken = prefs.getString('deviceToken');
  return deviceToken == null ? '':deviceToken;
}

///清除缓存
Future<bool> clearAssets() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.clear();
}