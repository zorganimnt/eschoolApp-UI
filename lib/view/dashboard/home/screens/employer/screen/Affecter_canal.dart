import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart';

import '../../../../../../routes/app_routes.dart';
import '../../../../../../utils/validators.dart';
import '../../../../../auth/components/select ajouter canal.dart';


class Listcanal extends StatelessWidget {
  Listcanal ({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (_) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0.2,
                            color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Liste des Formations",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 350,
                                child: WidgetTextField(
                                    context: context,
                                    label: "Recherche",
                                    hintText: "Rechercher une formations",
                                    icon: LineIcons.search),
                              ),
                            ],
                          ),
                        
                         
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(0.3),
                                width: double.infinity,
                                height: 50,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const[
                                      
                                      Text(
                                        "Titre",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      
                                      Text(
                                        "Catégorie",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      
                                      Text(
                                        "Durée",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                           Text(
                                        "Action",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                              ),
                                  Column(
                                children: [
                                  Container(
                                    color: Colors.white30,
                                    width: double.infinity,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Développement mobile"),
                                        Text("Informatique"),
                                        Text("4 Mois"),
                                            InkWell(
                                          onTap: () {
                                  add(context);
                                },
                                          child: Container(
                                            height: 30,
                                            width: MediaQuery.of(context).size.width * .1,
                                            child: Center(
                                                child: Text(
                                              "Ajouter",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 77, 144, 239),
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                borderRadius: BorderRadius.circular(15)),
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    color: Colors.white30,
                                    width: double.infinity,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                       Text("Photoshop & Illustrateur"),
                                        Text("Design"),
                                        Text("4 Mois"),
                                        InkWell(
                                          onTap: () {
                                  add(context);
                                },
                                          child: Container(
                                            height: 30,
                                            width: MediaQuery.of(context).size.width * .1,
                                            child: Center(
                                                child: Text(
                                              "Ajouter",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 77, 144, 239),
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                borderRadius: BorderRadius.circular(15)),
                                          ),
                                        ),       
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                                 Column(
                                children: [
                                  Container(
                                    color: Colors.white30,
                                    width: double.infinity,
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Développement web"),
                                        Text("Informatique"),
                                        Text("4 Mois"),
                                        InkWell(
                                          onTap: () {
                                  add(context);
                                },
                                          child: Container(
                                            height: 30,
                                            width: MediaQuery.of(context).size.width * .1,
                                            child: Center(
                                                child: Text(
                                              "Ajouter",
                                              style: TextStyle(
                                                  color: Color.fromARGB(255, 77, 144, 239),
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(255, 255, 255, 255),
                                                borderRadius: BorderRadius.circular(15)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  
}
Future<void> add(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        var controller;
        var validateNotNullOrEmpty;
        return AlertDialog(
          scrollable: true,
          title: Text("Affecter au canal"),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListBody(children: [
               SizedBox(
                                width: 350,
                                child: WidgetTextField(
                                    context: context,
                                    label: "Recherche",
                                    hintText: "Rechercher un apprenant",
                                    icon: LineIcons.search),
                              ),
                               
             
              Divider(
                height: 1.5,
              ),
              SizedBox(
                height: 20,
              ),
              
            ]),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Annuler")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller.addFormation();
                      //controller.getFormation("all");
                    },
                    child: Text("Affecter")),
              ],
            )
          ],
        );
      },
    );
  }
