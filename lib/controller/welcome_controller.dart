import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:line_icons/line_icons.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    getFormations("all");
    super.onInit();
  }

  List<String> image = [];
  List<String> title = [];
  List<String> categorie = [];
  List<int> formateur = [];
  List<double> prix = [];
  List<String> duree = [];
  RxBool isLoading = RxBool(false);

  getFormations(formation) async {
    image.clear();
    title.clear();
    categorie.clear();
    formateur.clear();
    prix.clear();
    duree.clear();
   

    var data = {
      "formation": formation,
    };
    isLoading.value = true;
    dynamic json = await API.getFormationService(data);
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        for (var element in data) {
          image.add(element['formation_picture']);
          title.add(element['formation_title']);
          categorie.add(element['formation_category']);
          formateur.add(element['formation_formateur']);
          prix.add(element['formation_price']);
          duree.add(element['formation_duree']);
        }
        update();
        isLoading.value = false;
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
        isLoading.value = false;
      }
    }
    return null;
  }
}