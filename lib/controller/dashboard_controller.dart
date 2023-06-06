import 'dart:convert';

import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:eschoolapp/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:line_icons/line_icons.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    getUsers("all");
    getCurrentUser();
    super.onInit();
  }

  RxString roleCurrentUser = ''.obs;
  RxString nameCurrentUser = ''.obs;
  RxString lastNameCurrentUser = ''.obs;
  RxString phoneCurrentUser = ''.obs;
  RxString emailCurrentUser = ''.obs;

  getCurrentUser() async {
    int id = await getValue('id');
    isLoading.value = true;
    var data = {
      "user": id,
    };
    print(data);
    dynamic json = await API.getUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        print(json);
        nameCurrentUser.value = json['data']['name'];
        lastNameCurrentUser.value = json['data']['lastName'];
        emailCurrentUser.value = json['data']['email'];
        phoneCurrentUser.value = json['data']['phone'];
        roleCurrentUser.value = json['data']['role'];
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  TextEditingController newEmail = TextEditingController(); 
  TextEditingController newName = TextEditingController(); 
  TextEditingController newLastName = TextEditingController(); 
  TextEditingController newPhone = TextEditingController(); 

  modifyProfile() async {
    int id = await getValue('id');

    if(newName.text!='') {
      var data = {
              
            "user_id": id,
            "name": newName.text,
            "lastName": lastNameCurrentUser.value,
            "phone": phoneCurrentUser.value,
            "email":emailCurrentUser.value
        
      };
           dynamic json = await API.modifyUserService(data);

      newName.clear();
    }
      if(newLastName.text!='') {
      var data = {
              
            "user_id": id,
            "name": nameCurrentUser.value,
            "lastName": newLastName.text,
            "phone": phoneCurrentUser.value,
            "email":emailCurrentUser.value
        
      };
           dynamic json = await API.modifyUserService(data);

      newLastName.clear(); 
    }
      if(newPhone.text!='') {
      var data = {
              
            "user_id": id,
            "name": nameCurrentUser.value,
            "lastName": lastNameCurrentUser.value,
            "phone": newPhone.text,
            "email":emailCurrentUser.value
        
      };
           dynamic json = await API.modifyUserService(data);

      newPhone.clear();
    }
      if(newEmail.text!='') {
      var data = {
              
            "user_id": id,
            "name": nameCurrentUser.value,
            "lastName": lastNameCurrentUser.value,
            "phone": phoneCurrentUser.value,
            "email":newPhone.text
        
      };
      print('data :::: ' + data.toString());
           dynamic json = await API.modifyUserService(data);
      newEmail.clear(); 
    }
          print(json);

    update(); 
    getCurrentUser(); 
  }

  //RxBool isLoading = RxBool(false);
  TextEditingController titleFormation = TextEditingController();
  TextEditingController photoFormation = TextEditingController();
  TextEditingController priceFormation = TextEditingController();
  TextEditingController formateurFormation = TextEditingController();
  TextEditingController dureeFormation = TextEditingController();
  TextEditingController categoryFormation = TextEditingController();

  RxString nameUser = ''.obs;
  RxString lastNameUser = ''.obs;
  RxString roleUser = ''.obs;
  RxString emailUser = ''.obs;
  RxString phoneUser = ''.obs;

  RxBool nameInChange = RxBool(false);
  RxBool lastNameInChnage = RxBool(false);
  RxBool phoneInChange = RxBool(false);
  RxBool emailInChange = RxBool(false);
  RxBool dateBirthInChange = RxBool(false);

  TextEditingController changedName = TextEditingController();
  TextEditingController changeLastName = TextEditingController();
  TextEditingController changePhone = TextEditingController();
  TextEditingController changeEmail = TextEditingController();
  TextEditingController changeDateBirth = TextEditingController();

  void putValue(name, lastName, tel, mail) {
    changedName.text = name;
    changeLastName.text = lastName;
    changePhone.text = tel;
    changeEmail.text = mail;
    update();
  }

  RxString changeNiveau = ''.obs;

  void modifyUser(inputID) {
    switch (inputID) {
      case 1:
        nameInChange.value = !nameInChange.value;

        break;
      case 2:
        lastNameInChnage.value = !lastNameInChnage.value;

        break;
      case 3:
        phoneInChange.value = !phoneInChange.value;

        break;
      case 4:
        emailInChange.value = !emailInChange.value;

        break;
      case 5:
        dateBirthInChange.value = !dateBirthInChange.value;

        break;
      default:
    }
  }

  RxBool homeSelected = RxBool(true);
  RxBool menu2 = RxBool(false);
  RxBool menu3 = RxBool(false);
  RxBool menu4 = RxBool(false);
  RxBool menu5 = RxBool(false);
  RxBool menu6 = RxBool(false);
  int selectedIndex = 0;
  void onChangeItem(index) {
    selectedIndex = index;

    update();
  }

  bool isSelected(index) {
    return index == selectedIndex;
  }

  int selectedUser = -1;
  bool apprenantSelected = false;
  bool parentSelected = false;
  bool formateurSelected = false;
  bool employerSelected = false;
  void changeUserFiltre(index) {
    switch (index) {
      case 0:
        apprenantSelected = !apprenantSelected;
        parentSelected = false;
        formateurSelected = false;
        employerSelected = false;
        apprenantSelected ? getApprenant('all') : getUsers('all');
        break;
      case 1:
        parentSelected = !parentSelected;
        apprenantSelected = false;
        formateurSelected = false;
        employerSelected = false;
        parentSelected ? getParent('all') : getUsers('all');
        break;
      case 3:
        formateurSelected = !formateurSelected;
        parentSelected = false;
        apprenantSelected = false;
        employerSelected = false;
        formateurSelected ? getFormateur('all') : getUsers('all');
        // formateurSelected? API.getUserByRole('Formateur') : null ;
        break;
      case 2:
        employerSelected = !employerSelected;
        formateurSelected = false;
        parentSelected = false;
        apprenantSelected = false;
        employerSelected ? getEmployer('all') : getUsers('all');
        //  employerSelected? API.getUserByRole('Formateur') : null ;
        break;
      default:
    }
    update();
  }

  bool isSelectedUser(index) {
    return index == selectedUser;
  }

  void changeSelect(menu) {
    switch (menu) {
      case 1:
        homeSelected.value = true;
        menu2.value = false;
        menu3.value = false;
        menu4.value = false;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 2:
        homeSelected.value = false;
        menu2.value = true;
        menu3.value = false;
        menu4.value = false;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 3:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = true;
        menu4.value = false;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 4:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = false;
        menu4.value = true;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 5:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = false;
        menu4.value = false;
        menu5.value = true;
        menu6.value = false;
        update();
        break;

      case 6:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = false;
        menu4.value = false;
        menu5.value = false;
        menu6.value = true;
        update();
        break;
      default:
    }
  }

  List<int> id = [];
  List<String> nom = [];
  List<String> prenom = [];
  List<String> email = [];
  List<String> role = [];
  List<String> statut = [];
  List<String> phone = [];
  RxBool isLoading = RxBool(false);

  // RECÉPURER TOUT LES UTILISATEURS
  getUsers(user) async {
    isLoading.value = true;
    clearAllList();

    // FocusManager.instance.primaryFocus?.unfocus();

    var data = {
      "user": user,
    };
    print(data);
    dynamic json = await API.getUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        for (var element in data) {
          id.add(element['id']);
          nom.add(element['name']);
          prenom.add(element['lastName']);
          email.add(element['email']);
          phone.add(element['phone']);
          role.add(element['role']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  getFormation(user) async {
    isLoading.value = true;
    clearAllList();

    // FocusManager.instance.primaryFocus?.unfocus();

    var data = {
      "user": user,
    };
    print(data);
    dynamic json = await API.getUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        for (var element in data) {
          id.add(element['id']);
          nom.add(element['name']);
          prenom.add(element['lastName']);
          email.add(element['email']);
          phone.add(element['phone']);
          role.add(element['role']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  TextEditingController searchEmail = TextEditingController();
  searchUser() async {
    isLoading.value = true;
    clearAllList();

    // FocusManager.instance.primaryFocus?.unfocus();

    var data = {
      "email": searchEmail.text,
    };
    print(data);
    dynamic json = await API.searchUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        print(data);
        for (var element in data) {
          id.add(element['id']);
          nom.add(element['name']);
          prenom.add(element['lastName']);
          email.add(element['email']);
          phone.add(element['phone']);
          role.add(element['role']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  getOneUser(user) async {
    isLoading.value = true;

    FocusManager.instance.primaryFocus?.unfocus();

    var data = {
      "user": user,
    };
    print(data);
    dynamic json = await API.getUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        print(json);
        id.add(json['data']['id']);
        nom.add(json['data']['name']);
        prenom.add(json['data']['lastName']);
        email.add(json['data']['email']);
        phone.add(json['data']['phone']);
        role.add(json['data']['role']);
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  // RECUPÉRER LA LISTE DES APPRENANTS
  List<String> dateBirth = [];

  void clearAllList() {
    dateBirth.clear();
    childEmail.clear();
    id.clear();
    nom.clear();
    prenom.clear();
    email.clear();
    role.clear();
    statut.clear();
    phone.clear();
  }

  getApprenant(user) async {
    clearAllList();
    isLoading.value = true;

    FocusManager.instance.primaryFocus?.unfocus();

    var data = {"user": user, "role": "Apprenant"};
    print(data);
    dynamic json = await API.getUserByRole(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        print(data);
        for (var element in data) {
          dateBirth.add(element['apprenant_date_birth']);
          getOneUser(element['apprenant_id']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  // LISTE DES PARENTS
  List<String> childEmail = [];

  getParent(user) async {
    isLoading.value = true;
    clearAllList();
    FocusManager.instance.primaryFocus?.unfocus();

    var data = {"user": user, "role": "Parent"};
    print(data);
    dynamic json = await API.getUserByRole(data);

    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        print(data);
        for (var element in data) {
          childEmail.add(element['parent_child_email']);
          getOneUser(element['parent_id']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  getFormateur(user) async {
    isLoading.value = true;
    clearAllList();
    FocusManager.instance.primaryFocus?.unfocus();

    var data = {"user": user, "role": "Formateur"};
    print(data);
    dynamic json = await API.getUserByRole(data);

    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        print(data);
        for (var element in data) {
          getOneUser(element['formateur_id']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  getEmployer(user) async {
    isLoading.value = true;
    clearAllList();
    FocusManager.instance.primaryFocus?.unfocus();

    var data = {"user": user, "role": "Employer"};
    print(data);
    dynamic json = await API.getUserByRole(data);

    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        print(data);
        for (var element in data) {
          getOneUser(element['employer_id']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  // SUPPRIMER UN UTILISATEUR
  deleteUser(user) async {
    var data = {
      "user_id": user,
    };
    print(data);
    dynamic json = await API.deleteUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess("Success", "Utilisateur supprimer", LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  // AJOUTER EMPLOYER
  TextEditingController nameEmp = TextEditingController();
  TextEditingController lastNameEmp = TextEditingController();
  TextEditingController emailEmp = TextEditingController();
  TextEditingController telEmp = TextEditingController();
  TextEditingController passEmp = TextEditingController();
  addEmployer() async {
    var data = {
      "name": nameEmp.text,
      "lastName": lastNameEmp.text,
      "phone": telEmp.text,
      "email": emailEmp.text,
      "password": passEmp.text
    };
    print(data);
    dynamic json = await API.addEmployerService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess(
            "Success", "Employer ajouté avec succées", LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  // MODIFIER UN UTILISATEUR
  updateUser(id) async {
    var data = {
      "user_id": id,
      "name": changedName.text,
      "lastName": changeLastName.text,
      "phone": changePhone.text,
      "email": changeEmail.text,
    };
    print(data);
    dynamic json = await API.modifyUserService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess("Success", "Utilisateur modifier avec succées",
            LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    changeEmail.clear();
    changeLastName.clear();
    changedName.clear();
    changePhone.clear();
    emailInChange.value = false;
    nameInChange.value = false;
    lastNameInChnage.value = false;
    phoneInChange.value = false;

    return null;
  }

  // Méthode pour ajouter une formation
  addFormation() async {
    var data = {
      "formation_title": titleFormation.text,
      "formation_picture": photoFormation.text,
      "formation_price": priceFormation.text,
      "formation_formateur": formateurFormation.text,
      "formation_duree": dureeFormation.text,
      "categoryFormation": categoryFormation.text,
      //"formation_duree": dureeFormation.value
    };
    try {
      dynamic json = await API.addFormationService(data);
      if (json != null) {
        if (json['success']) {
          showSuccess("Success", "Formation ajouté avec succées",
              LineIcons.checkCircle);
        } else {
          showError("Error", json['message'], LineIcons.exclamationTriangle);
        }
      }
    } catch (e) {
      showError(
          "Erreur est servenue", e.toString(), LineIcons.exclamationTriangle);
    } finally {
      titleFormation.clear();
      photoFormation.clear();
      priceFormation.clear();
      formateurFormation.clear();
      isLoading.value = false;
    }
  }
}
