import 'package:eschoolapp/main.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class FormationController extends GetxController {
  @override
  void onInit() {
    getFormation("all");
    super.onInit();
  }

  RxBool isLoading = RxBool(false);
  TextEditingController titleFormation = TextEditingController();
  TextEditingController photoFormation = TextEditingController();
  TextEditingController priceFormation = TextEditingController();
  TextEditingController formateurFormation = TextEditingController();

  List<String> formateurNames = [];
  RxString dureeFormation = ''.obs;
  RxString categoryFormation = ''.obs;

  TextEditingController searchBar = TextEditingController();

  // Méthode pour ajouter une formation
  Future<void> addFormation() async {
    var data = {
      "formation_title": titleFormation.text,
      "formation_picture": photoFormation.text,
      "formation_price": priceFormation.text,
      "formation_formateur": formateurFormation.text,
      "formation_duree": dureeFormation.value
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

  Future<void> searchFormation(value) async {
    RxString nomFormateur = ''.obs; 
    rows.clear();
    var data = {
      "title":value,
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
                  onPressed: () {},
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
                  onPressed: () {},
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

  DataCell actionCell() {
    return DataCell(Row(children: [
      IconButton(
        hoverColor: Colors.transparent,
        icon: Icon(
          LineIcons.pen,
          color: Colors.grey,
          size: 21,
        ),
        onPressed: () {},
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

  // Méthode pour afficher une/des formation

  // Méthode pour supprimer une formation

  // Méthode pour recherche une formation

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
  /*     id.add(element['id']);
            title.add(element['formation_title']);
            price.add(element['formation_price']);
            photo.add(element['formation_picture']);
            formateur.add(element['formation_formateur']);
            category.add(element['formation_category']);
            duree.add(element['formation_duree']); */

}
