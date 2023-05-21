import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static ValueNotifier<bool> isTokenSaved = ValueNotifier(false);  
  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    isTokenSaved.value = token != null;
  }
}
//pour garder les données dans la cache
Future<void> saveValue(String key, dynamic value) async {
  final prefs = await SharedPreferences.getInstance();
  if (value is int) {
    await prefs.setInt(key, value);
  } else if (value is double) {
    await prefs.setDouble(key, value);
  } else if (value is bool) {
    await prefs.setBool(key, value);
  } else if (value is String) {
    await prefs.setString(key, value);
  } else if (value is List<String>) {
    await prefs.setStringList(key, value);
  } else {
    throw Exception('Unsupported value type');
  }
}

Future<bool> isContainKey(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.containsKey(key);
}

Future<dynamic> getValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.get(key);
}

Future<dynamic> removeValue(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.remove(key);
}

Future<void> clearAll() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
}
