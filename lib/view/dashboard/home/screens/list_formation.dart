import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ListFormation extends StatelessWidget {
  ListFormation({super.key});

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
                      boxShadow: [
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
                                "Liste des formations",
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(0.3),
                                width: double.infinity,
                                height: 50,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Titre",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Formateur",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Durée",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Prix",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Action",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        height: 50,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: const [
                                              Text("88"),
                                              Text("Dévelopement mobile"),
                                              Text("Foulen"),
                                              Text("3 mois"),
                                              Text("200 DT"),
                                              Text("modifier"),
                                            ]),
                                      );
                                    }),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
