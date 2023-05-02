import 'dart:convert';

import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:line_icons/line_icons.dart';

class RegisterController extends GetxController {
  // USER INPUT CONTROLLER
  TextEditingController? nameUser = TextEditingController();
  TextEditingController? lastNameUser = TextEditingController();
  TextEditingController? phoneUser = TextEditingController();
  TextEditingController? emailUser = TextEditingController();
  TextEditingController? passwordUser = TextEditingController();
  RxString role = ''.obs; 
  // CIRCLE PROGRESS CONDITION
  RxBool isLoading = RxBool(false);

  // HANDLE REGISTER USER INPUT
  reigsterUser() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (nameUser!.text.isEmpty ||
        lastNameUser!.text.isEmpty ||
        phoneUser!.text.isEmpty ||
        emailUser!.text.isEmpty ||
        passwordUser!.text.isEmpty) {
      showError(
          "Error", "Informations est vide", LineIcons.exclamationTriangle);
      isLoading.value = false;
      return;
    }
    var data = {
      "name": nameUser!.text,
      "lastName": lastNameUser!.text,
      "phone": phoneUser!.text,
      "email": emailUser!.text,
      "password": passwordUser!.text,
      "role" : role.value
    };
    print(data);
    dynamic json = await API.registerUserService(data);
    if (json != null) {
      if (json['success']) {
        Get.offAllNamed(AppRoutes.nextStepRegister);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }

    return null;
  }
}
