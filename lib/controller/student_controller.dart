import 'dart:convert';

import 'package:eschoolapp/model/student.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  // les variables li nest7a9hom fel affichage men base
  //cin hiya bech n8otha fel input
  //loading hiya li bech tafichili aka circle li dour 9bal metjib l data
  //studentMode hiya li bech nsob fiha data li ena hachti b name w img:mazelt marak7thech
  TextEditingController cin = TextEditingController();
  RxBool loading = false.obs;
  Rx<StudentModel> studentModel = StudentModel().obs;

  // hedhi method bech traja3li StudentModel
  //9bal kona najoutiwhom fi west tableaux fi 3oudh tab sta3mlna model
  Future<StudentModel?> getStudentByCin() async {
    // ki yabda ylodi ekid bech ykoun true : donc l circle dour
    loading.value = true;

    var data = {"cin": cin.text};
    // njib data w n7othom fi variable json
    dynamic json = await API.getStudentByCinAPI(data);

    // edha ken non null donc fih data jet men base
    if (json != null) {
      // edha ken raja3 success = true donc t3adet shiha
      if (json['success']) {
        // t3adet shiha donc n3abi model mte3i b les data li jew men base o li hathom f variable json
        StudentModel model = StudentModel.fromJson(json['data']);
        studentModel.value = model;

        // wa9aft l circle li dour puisque c bon affichit l data w jebthom men db
        loading.value = false;

        // else 3al succes ken == false
      } else {
        loading.value = false;
        Get.snackbar("Error", json['message'] ?? '');
        return null;
      }
    }
    // o hedhi return null 3al if li raj3t json==null
    return null;
  }
}
