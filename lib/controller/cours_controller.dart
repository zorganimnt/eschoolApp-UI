import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/state_manager.dart';


class CoursController extends GetxController {
  @override
  void onInit() {
    getCours("all");
    super.onInit();
  }
  void clearAllList() {
    id_cours.clear();
    formation_id.clear();
    nom_cours.clear();
    description_cours.clear();
    support_cours.clear();
  }
  List<int> id_cours = [];
  List<double> formation_id = [];
  List<String> nom_cours = [];
  List<String> description_cours = [];
  List<String> support_cours = [];

  RxBool isLoading = RxBool(false);

  // RECÉPURER TOUT LES COURS
  getCours(cours) async {
    isLoading.value = true;
    clearAllList();
   // FocusManager.instance.primaryFocus?.unfocus();
    var data = {
      "cours": cours,
    };
    print(data);
    dynamic json = await API.getCoursService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        for (var element in data) {
          id_cours.add(element['id']);
          formation_id.add(element['IdFormation']);
          nom_cours.add(element['NameCours']);
          description_cours.add(element['DescriptionCours']);
          support_cours.add(element['SupportCours']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }
// RECÉPURER UN COURS
   getOneCours(cours) async {
    isLoading.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
    var data = {
      "cours": cours,
    };
    print(data);
    dynamic json = await API.getCoursService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        print(json);
        id_cours.add(json['data']['id']);
        formation_id.add(json['data']['IdFormation']);
        nom_cours.add(json['data']['NameCours']);
        description_cours.add(json['data']['DescriptionCours']);
        support_cours.add(json['data']['SupportCours']);
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }
    // SUPPRIMER UN COURS
  deleteCours(cours) async {
    var data = {
      "cours_id": cours,
    };
    print(data);
    dynamic json = await API.deleteCoursService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess("Success", "Cours supprimer", LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }
    // AJOUTER COURS
  TextEditingController nameCours = TextEditingController();
  TextEditingController idFormation = TextEditingController();
  TextEditingController descriptionCours = TextEditingController();
  TextEditingController supportCours = TextEditingController();
  addCours() async {
    var data = {
      "name": nameCours.text,
      "id_formation": idFormation.text,
      "description_cours": descriptionCours.text,
      "support_cours": supportCours.text,
    };
    print(data);
    dynamic json = await API.addCoursService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess(
            "Success", "Cours ajouté avec succées", LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }
  RxString coursname = ''.obs;
  RxString formationid = ''.obs;
  RxString coursdescription = ''.obs;
  RxString courssupport = ''.obs;

  RxBool nameCoursInChange = RxBool(false);
  RxBool idFormationInChnage = RxBool(false);
  RxBool descriptionCoursInChange = RxBool(false);
  RxBool supportCoursInChange = RxBool(false);

  TextEditingController changedNameCours = TextEditingController();
  TextEditingController changedidFormation = TextEditingController();
  TextEditingController changeddescriptionCours = TextEditingController();
  TextEditingController changedsupportCours = TextEditingController();

  void putValue(nameCours, idFormation, description, support) {
    changedNameCours.text = nameCours;
    changedidFormation.text = idFormation;
    changeddescriptionCours.text = description;
    changedsupportCours.text = support;
    update();
  }

  void modifyCours(inputID) {
    switch (inputID) {
      case 1:
        nameCoursInChange.value = !nameCoursInChange.value;

        break;
      case 2:
        idFormationInChnage.value = !idFormationInChnage.value;

        break;
      case 3:
        descriptionCoursInChange.value = !descriptionCoursInChange.value;

        break;
      case 4:
        supportCoursInChange.value = !supportCoursInChange.value;

        break;
      default:
    }
  }
   // MODIFIER UN Cours
  updateCours(id) async {
    var data = {
      "cours_id": id,
      "name": changedNameCours.text,
      "formation_id": changedidFormation.text,
      "description": changeddescriptionCours.text,
      "support": changedsupportCours.text,
    };
    print(data);
    dynamic json = await API.modifyUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess("Success", "Cours modifier avec succées",
            LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    changedNameCours.clear();
    changedidFormation.clear();
    changeddescriptionCours.clear();
    changedsupportCours.clear();
    nameCoursInChange.value = false;
    idFormationInChnage.value = false;
    descriptionCoursInChange.value = false;
    supportCoursInChange.value = false;

    return null;
  }

}