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

  // GET USERS
  static Future<dynamic> getUserService(var data) async {
    String theUrl = '$url/get-user';
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

   static Future<dynamic> getUserByRole(var data) async {
    String theUrl = '$url/get-user-by-role';
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }


  // ADD EMPLOYER
  static Future<dynamic> addEmployerService(var data) async {
    String theUrl = '$url/add-employer';
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

  static Future<dynamic> loginService(var data) async {
    String theUrl = '$url/login';
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

  // UPDATE USER
  static Future<dynamic> updateUserService(var data) async {
    String theUrl = '$url/register';
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

  // DELETE USER
  static Future<dynamic> deleteUserService(var data) async {
    String theUrl = '$url/delete-user';
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


  // MODIFIER UN UTILISATEUR
  static Future<dynamic> modifyUserService(var data) async {
    String theUrl = '$url/modify-user';
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
}
