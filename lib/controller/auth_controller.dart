import 'dart:convert';

import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:eschoolapp/utils/storage.dart';
import 'package:eschoolapp/view/home/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';

class AuthController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var error = ''.obs;
  var token = ''.obs;

  final API _api = API();
  RxBool isLoading = RxBool(false);
  handleLogin() async {
    isLoading.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
    if (email.text.length < 3 || password.text.length < 6) {
      showError(
          "Error", "Informations est vide", LineIcons.exclamationTriangle);
      isLoading.value = false;
      return;
    }
    var data = {"email": email.text, "password": password.text};
    print(data);
    dynamic json = await API.loginService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        if (json['data']['user_data']['role'] == 'Admin') {
        
          Get.offAllNamed(AppRoutes.homeDashboard);
        } else {
          showError(
              "Erreur", "Vous n'avez pas le droit", LineIcons.exclamation);
        }
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  RxBool isOnHover = RxBool(false);
  void changeHover(value) {
    isOnHover.value = value; 
    update(); 
  }
}
