import 'dart:convert';

import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:eschoolapp/utils/storage.dart';
import 'package:eschoolapp/view/auth/next_step_register.dart';
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
  TextEditingController? emailChild = TextEditingController();

  // APPRENANT INPUT CONTROLLER
  TextEditingController? birthDay = TextEditingController();

  RxString role = ''.obs;
  RxString niveau = ''.obs;
  RxString speciality = ''.obs;

  // CIRCLE PROGRESS CONDITION
  RxBool isLoading = RxBool(false);

  // HANDLE REGISTER USER INPUT
  reigsterUser() async {
    isLoading.value = true;

    FocusManager.instance.primaryFocus?.unfocus();
    if (nameUser!.text.isEmpty ||
        lastNameUser!.text.isEmpty ||
        phoneUser!.text.isEmpty ||
        emailUser!.text.isEmpty ||
        role.value == '' ||
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
      "role": role.value
    };
    dynamic json = await API.registerUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        await saveValue("userID", json['data']['id']);
        Get.to(NextStepRegister(
          role: role.value,
        ));
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  // HANDLE APPRENANT INPUT
  registerApprenant(context) async {
    isLoading.value = true;
    int userID = await getValue('userID');
    FocusManager.instance.primaryFocus?.unfocus();
    if (birthDay!.text.isEmpty || niveau.value == '') {
      showError(
          "Error", "Informations est vide", LineIcons.exclamationTriangle);
      isLoading.value = false;
      return;
    }
    var data = {
      "user_id": userID,
      "apprenant_level_school": niveau.value,
      "apprenant_date_birth": birthDay!.text,
      "apprenant_statut": "En Cours"
    };
    print(data);
    dynamic json = await API.registerUserByRole(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showConfirmation(context);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  registerParent() async {
    isLoading.value = true;
    int userID = await getValue('userID');
    FocusManager.instance.primaryFocus?.unfocus();
    if (emailChild!.text.isEmpty) {
      showError(
          "Error", "Informations est vide", LineIcons.exclamationTriangle);
      isLoading.value = false;
      return;
    }
    var data = {
      "user_id": userID,
      "child_email": emailChild!.text,
      "parent_statut" : "En Cours"
    };
    print(data);
    dynamic json = await API.registerUserByRole(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        Get.to(NextStepRegister(
          role: role.value,
        ));
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  registerFormateur() async {
    isLoading.value = true;
    int userID = await getValue('userID');
    FocusManager.instance.primaryFocus?.unfocus();
    if (speciality.value == '') {
      showError(
          "Error", "Informations est vide", LineIcons.exclamationTriangle);
      isLoading.value = false;
      return;
    }
    var data = {
      "user_id": userID,
      "formateur_speciality": speciality.value,
      "formateur_cv": "cv",
      "formateur_statut" : "En Cours"
    };
    print(data);
    dynamic json = await API.registerUserByRole(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        Get.to(NextStepRegister(
          role: role.value,
        ));
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  Future<void> showConfirmation(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Succées"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text("Inscription en cours de traitement")],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Get.offAllNamed(AppRoutes.welcome);
                },
                child: Text("D'accord"))
          ],
        );
      },
    );
  }
}
