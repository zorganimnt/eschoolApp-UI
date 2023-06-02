import 'package:eschoolapp/main.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/state_manager.dart';

class FormationController extends GetxController {
  @override
  void onInit() {
    getFormation("all");
    super.onInit();
  }

  List<String> role = [];
  List<int> id = [];
  List<String> formationnom = [];
  List<String> formationphoto = [];
  List<double> formationprix = [];
  List<String> formationformateur = [];
  List<String> formationduree = [];
  List<String> formationcategory = [];
  RxBool isLoading = RxBool(false);
  TextEditingController titleFormation = TextEditingController();
  TextEditingController photoFormation = TextEditingController();
  TextEditingController priceFormation = TextEditingController();
  TextEditingController formateurFormation = TextEditingController();
  TextEditingController dureeFormation = TextEditingController();
  TextEditingController categoryFormation = TextEditingController();

  List<String> formateurNames = [];
  

  TextEditingController searchBar = TextEditingController();

  // Méthode pour ajouter une formation
  Future<void> addFormation() async {
    var data = {
      "formation_title": titleFormation.text,
      "formation_picture": photoFormation.text,
      "formation_price": priceFormation.text,
      "formation_formateur": formateurFormation.text,
      "formation_duree": dureeFormation.text,
      "categoryFormation": categoryFormation.text,
      
    };

    print(data);
    dynamic json = await API.addFormationService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess(
            "Success", "Formation ajouté avec succées", LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

// Méthode pour rechercher une formation
  Future<void> searchFormation(value) async {
    RxString nomFormateur = ''.obs;
    rows.clear();
    var data = {
      "title": value,
    };
    try {
      dynamic json = await API.searchFormationService(data);
      if (json != null) {
        if (json['success']) {
          List<dynamic> data = json['data'];
          print(data);
          for (var element in data) {
            dynamic json = await API.getUserService({
              "user": element['formation_formateur'],
            });
            if (json != null) {
              if (json['success']) {
                nomFormateur.value =
                    json['data']['name'] + ' ' + json['data']['lastName'];
              } else {
                showError(
                    "Error", json['message'], LineIcons.exclamationTriangle);
              }
            }
            DataRow row = DataRow(cells: [
              DataCell(Text(element['id'].toString())),
              DataCell(Text(element['formation_title'])),
              DataCell(Text(element['formation_category'])),
              DataCell(Text('${element['formation_price']} DT')),
              DataCell(Text(nomFormateur.value)),
              DataCell(Text(element['formation_duree'])),
              DataCell(Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(element['formation_picture']))),
                ),
              )),
              DataCell(Row(children: [
                IconButton(
                  hoverColor: Colors.transparent,
                  icon: Icon(
                    LineIcons.pen,
                    color: Colors.grey,
                    size: 21,
                  ),
                  onPressed: (
                     
                      ) {},
                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  hoverColor: Colors.transparent,
                  icon: Icon(
                    LineIcons.trash,
                    size: 21,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {},
                )
              ]))
            ]);
            rows.add(row);
          }
          update();
        } else {
          showError("Error", json['message'], LineIcons.exclamationTriangle);
        }
      }
    } catch (e) {
      print(e.toString());
      showError(
          "Erreur est servenue", e.toString(), LineIcons.exclamationTriangle);
    } finally {
      isLoading.value = false;
    }
  }

  // Méthode pour afficher un/des formation

  List<DataRow> rows = [];
  Future<void> getFormation(formation) async {
    RxString nomFormateur = ''.obs;
    rows.clear();
    var data = {
      "formation": formation,
    };
    try {
      dynamic json = await API.getFormationService(data);
      if (json != null) {
        if (json['success']) {
          List<dynamic> data = json['data'];
          print(data);
          for (var element in data) {
            dynamic json = await API.getUserService({
              "user": element['formation_formateur'],
            });
            if (json != null) {
              if (json['success']) {
                nomFormateur.value =
                    json['data']['name'] + ' ' + json['data']['lastName'];
              } else {
                showError(
                    "Error", json['message'], LineIcons.exclamationTriangle);
              }
            }
            DataRow row = DataRow(cells: [
              DataCell(Text(element['id'].toString())),
              DataCell(Text(element['formation_title'])),
              DataCell(Text(element['formation_category'])),
              DataCell(Text('${element['formation_price']} DT')),
              DataCell(Text(nomFormateur.value)),
              DataCell(Text(element['formation_duree'])),
              DataCell(Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(element['formation_picture']))),
                ),
              )),
              DataCell(Row(children: [
                IconButton(
                  hoverColor: Colors.transparent,
                  icon: Icon(
                    LineIcons.pen,
                    color: Colors.grey,
                    size: 21,
                  ),

                  onPressed: () {updateFormation(element['id']);},

                ),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  hoverColor: Colors.transparent,
                  icon: Icon(
                    LineIcons.trash,
                    size: 21,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    deleteFormation(element['id']);
                    getFormation('all');
                  },
                )
              ]))
            ]);
            rows.add(row);
          }
          update();
        } else {
          showError("Error", json['message'], LineIcons.exclamationTriangle);
        }
      }
    } catch (e) {
      print(e.toString());
      showError(
          "Erreur est servenue", e.toString(), LineIcons.exclamationTriangle);
    } finally {
      isLoading.value = false;
    }
  }

  DataCell actionCell() {
    return DataCell(Row(children: [
      IconButton(
        hoverColor: Colors.transparent,
        icon: Icon(
          LineIcons.pen,
          color: Colors.grey,
          size: 21,
        ),
        onPressed: () {
        },
      ),
      SizedBox(
        width: 10,
      ),
      IconButton(
        hoverColor: Colors.transparent,
        icon: Icon(
          LineIcons.trash,
          size: 21,
          color: Colors.redAccent,
        ),
        onPressed: () {
          
        },
      )
    ]));
  }

  DataCell ImageCell(link) {
    rows.clear();
    return DataCell(Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(link))),
      ),
    ));
  }

  // Méthode pour modifier une formation

  // MODIFIER UNE FORMATION
  RxBool nameFormationInChange = RxBool(false);
  RxBool PictureFormationInChnage = RxBool(false);
  RxBool PriceFormationInChange = RxBool(false);
  RxBool FormateurFormationInChange = RxBool(false);
  RxBool DureeFormationInChange = RxBool(false);
  RxBool CategoryFormationInChange = RxBool(false);

  TextEditingController changeNameFormation = TextEditingController();
  TextEditingController changePictureFormation = TextEditingController();
  TextEditingController changePriceFormation = TextEditingController();
  TextEditingController changeFormateurFormation = TextEditingController();
  TextEditingController changeDureeFormation = TextEditingController();
  TextEditingController changeCategoryFormation = TextEditingController();

  void putValue(name, picture, price, formateur, duree, category) {
    changeNameFormation.text = name;
    changePictureFormation.text = picture;
    changePriceFormation.text = price;
    changeFormateurFormation.text = formateur;
    changeDureeFormation.text = duree;
    changeCategoryFormation.text = category;

    update();
  }

  void modifyFormation(inputID) {
    switch (inputID) {
      case 1:
        nameFormationInChange.value = !nameFormationInChange.value;

        break;
      case 2:
        PictureFormationInChnage.value = !PictureFormationInChnage.value;

        break;
      case 3:
        PriceFormationInChange.value = !PriceFormationInChange.value;

        break;
      case 4:
        FormateurFormationInChange.value = !FormateurFormationInChange.value;

        break;
      case 5:
        DureeFormationInChange.value = !DureeFormationInChange.value;

        break;
      case 6:
        CategoryFormationInChange.value = !CategoryFormationInChange.value;

        break;
      default:
    }
  }

  updateFormation(id) async {
    var data = {
      "formation_id": id,
      "formation_title": titleFormation.text,
      "formation_picture": photoFormation.text,
      "formation_price": priceFormation.text,
      "formation_formateur": formateurFormation.text,
      "formation_duree": dureeFormation.text,
      "categoryFormation": categoryFormation.text,
    };
    print(data);
    dynamic json = await API.modifyFormationService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess("Success", "Formation modifier avec succées",
            LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    changeNameFormation.clear();
    changePictureFormation.clear();
    changePriceFormation.clear();
    changeFormateurFormation.clear();
    changeDureeFormation.clear();
    PictureFormationInChnage.value = false;
    PriceFormationInChange.value = false;
    FormateurFormationInChange.value = false;
    DureeFormationInChange.value = false;
    CategoryFormationInChange.value = false;

    return null;
  }

  // SUPPRIMER UN UTILISATEUR
  deleteFormation(formation) async {
    var data = {
      "formation_id": formation,
    };
    print(data);
    dynamic json = await API.deleteFormationService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess("Success", "Formation supprimer", LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  List<DataColumn> columns = const [
    DataColumn(
        label: Text(
      'ID',
      style: TextStyle(fontWeight: FontWeight.bold),
    )),
    DataColumn(
        label: Text('Titre', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label:
            Text('Catégorie', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label: Text('Prix', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label:
            Text('Formateur', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label: Text('Durée', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label: Text('Photo', style: TextStyle(fontWeight: FontWeight.bold))),
    DataColumn(
        label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold))),
  ];
 
}
