import 'dart:async';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:eschoolapp/config/config.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/utils/check_conx_internet.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:eschoolapp/utils/storage.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:line_icons/line_icons.dart';

class API {
  static var client = Dio();
  static String url = AddressConfig.apiBaseUrl;

  // REGISTER USER
  static Future<dynamic> registerUserService(var data) async {
    String theUrl = '$url/register-user';
    print(theUrl); 
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString()); 
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // REGISTER USER BY ROLE
  static Future<dynamic> registerUserByRole(var data) async {
    String theUrl = '$url/register';
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }
}
