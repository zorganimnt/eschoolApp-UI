import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:eschoolapp/utils/storage.dart';
import 'package:eschoolapp/view/dashboard/home/screens/add_employer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:line_icons/line_icons.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    getUsers("all");
    getApprenant('all');
    super.onInit();
  }

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
        break;
      case 1:
        parentSelected = !parentSelected;
        break;
      case 3:
        formateurSelected = !formateurSelected;
        break;
      case 2:
        employerSelected = !employerSelected;
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
  List<String> dateBirth = [];

  List<String> statut = [];
  List<String> phone = [];

  RxBool isLoading = RxBool(false);

  // RECÉPURER TOUT LES UTILISATEURS
  getUsers(user) async {
   
    isLoading.value = true;
    id.clear();
    nom.clear();
    prenom.clear();
    email.clear();
    role.clear();
    statut.clear();
    phone.clear();

    FocusManager.instance.primaryFocus?.unfocus();

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

  // RECUPÉRER LA LISTE DES APPRENANTS
  getApprenant(user) async {
    isLoading.value = true;
    dateBirth.clear();

    FocusManager.instance.primaryFocus?.unfocus();

    var data = {"user": user, "role": "Apprenant"};
    print(data);
    dynamic json = await API.getUserByRole(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        for (var element in data) {
          dateBirth.add(element['apprenant_date_birth']);
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
}
