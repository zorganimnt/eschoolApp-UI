import 'dart:async';
import 'dart:convert';

import 'package:eschoolapp/model/parent.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentController extends GetxController {
  //TextEditingController cin = TextEditingController();


  @override
  void onInit() async {
    super.onInit();
    await getParentProfile(); 
  }

  // initialisation mta3 loading state ki yabda ylodi
  RxBool loading = false.obs;
  // init mta3 parentModel li bech nhotou fih les info
  Rx<ParentModel> parentModel = ParentModel().obs;

  var cin = "14008020";
  Future<ParentModel?> getParentProfile() async {
    // ki yabda ylodi ekid bech ykoun true
    loading.value = true;
    // naamlou get lel info men API o nhotouh fi json fi 3oudh tableaux
    dynamic json = await API.getParentInfo(cin);
    if (json != null) {
      if (json['success']) {
        loading.value = false;
        ParentModel model = ParentModel.fromJson(json['data']);
        parentModel.value = model;
        print(parentModel.value.cinParent);
      } else {
        loading.value = false;
        Get.snackbar("Error", json['message'] ?? '');
        return null;
      }
    }
    return null;
  }

  
}
