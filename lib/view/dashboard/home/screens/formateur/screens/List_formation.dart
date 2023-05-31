import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/controller/formation_controller.dart';
import 'package:eschoolapp/view/dashboard/home/screens/formateur/screens/list_cours.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart';

import '../../../../../../routes/app_routes.dart';

class Formation extends StatelessWidget {
  Formation({super.key});

  final FormationController controller = Get.put(FormationController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormationController>(
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
                        blurRadius: 1, spreadRadius: 0.2, color: Colors.grey)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(children: [
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
                              hintText: "Rechercher un utilisateur",
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text(
                                  "Titre",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Catégorie",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Durée",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Cours",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height,
                          child: ListView.builder(
                              itemCount: controller.id.length,
                              itemBuilder: (context, index) {
                                return controller.role[index] == 'Admin'?
                                     SizedBox()
                                    : Container(
                                        width: double.infinity,
                                        height: 50,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(controller.formationnom[index]),
                                              Text(controller.formationcategory[index]),
                                              Text(controller.formationduree[index]),
                                              // Container(
                                              //   height: 60,
                                              //   width: 80,
                                              //   decoration: BoxDecoration(image: DecorationImage(image:NetworkImage(controller.formationphoto[index])) ),
                                              // )
                                             
                                            ]),
                                      );
                              }),
                        )
                      ],
                    ),
                  ]),
                ),
              ),
            ))));
  }
}
