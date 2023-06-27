import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? "";
  }

  static Future<void> setString(String key, String s) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, s);
  }

  static Future<bool> getBool(String key, {bool patterResponse = false}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? patterResponse;
  }

  static Future<void> setBool(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  static Future<void> clean() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}