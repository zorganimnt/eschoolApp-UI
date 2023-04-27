import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';

class ListUsers extends StatelessWidget {
   ListUsers({super.key});
  final DashboardController controller = Get.put(DashboardController()); 
  @override
  Widget build(BuildContext context) {
        return GetBuilder<DashboardController>(
   builder: (_) =>
     Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 1.2,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 1, spreadRadius: 0.2, color: Colors.grey)
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
                      "Liste des utilisateurs",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changeUserFiltre(0);
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: controller.apprenantSelected
                            ? BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(15))
                            : BoxDecoration(
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.deepOrange,
                                        spreadRadius: 1)
                                  ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          'Apprenant',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: controller.apprenantSelected
                                  ? Colors.white
                                  : Colors.deepOrange),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        controller.changeUserFiltre(1);
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: controller.parentSelected
                              ? BoxDecoration(
                                  color: Colors.deepPurple,
                                  borderRadius: BorderRadius.circular(15))
                              : BoxDecoration(
                                  boxShadow: [
                                      BoxShadow(
                                          color: Colors.deepPurple,
                                          spreadRadius: 1)
                                    ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          'Parent',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: controller.parentSelected
                                    ? Colors.white
                                    : Colors.deepPurple),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                         controller.changeUserFiltre(2); 
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration:controller.employerSelected
                              ? BoxDecoration(
                                  color: Colors.red.shade800,
                                  borderRadius: BorderRadius.circular(15))
                              : BoxDecoration(
                                  boxShadow: [
                                      BoxShadow(
                                          color: Colors.red.shade800,
                                          spreadRadius: 1)
                                    ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          'Employer',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: controller.employerSelected
                                      ? Colors.white
                                      : Colors.red.shade800),
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        controller.changeUserFiltre(3); 
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        decoration: controller.formateurSelected
                              ? BoxDecoration(
                                  color: Colors.green.shade800,
                                  borderRadius: BorderRadius.circular(15))
                              : BoxDecoration(
                                  boxShadow: [
                                      BoxShadow(
                                          color: Colors.green.shade800,
                                          spreadRadius: 1)
                                    ],
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Text(
                          'Formateur',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: controller.formateurSelected
                                      ? Colors.white
                                      : Colors.green.shade800),
                        )),
                      ),
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
                          children: [
                            Text(
                              "ID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Nom",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Prénom",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "E-mail",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Numéro de téléphone",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Action",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ]),
                    ),
                    Container(
                      color: Colors.red.withOpacity(0.1),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("01"),
                            Text("Rania"),
                            Text("Ben Ammar"),
                            Text("rania@mail.com"),
                            Text("20600200"),
                            Row(
                              children: [
                                Icon(
                                  LineIcons.eye,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  LineIcons.trash,
                                  color: Colors.redAccent,
                                )
                              ],
                            )
                          ]),
                    ),
                    Container(
                      color: Colors.green.withOpacity(0.1),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("01"),
                            Text("Montasar"),
                            Text("Zor"),
                            Text("monta@mail.com"),
                            Text("20600200"),
                            Row(
                              children: [
                                Icon(
                                  LineIcons.eye,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  LineIcons.trash,
                                  color: Colors.redAccent,
                                )
                              ],
                            )
                          ]),
                    ),
                    Container(
                      color: Colors.purple.withOpacity(0.1),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("01"),
                            Text("Oussema"),
                            Text("Oussema"),
                            Text("ousmea@mail.com"),
                            Text("20600200"),
                            Row(
                              children: [
                                Icon(
                                  LineIcons.eye,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  LineIcons.trash,
                                  color: Colors.redAccent,
                                )
                              ],
                            )
                          ]),
                    ),
                    Container(
                      color: Colors.orange.withOpacity(0.1),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("01"),
                            Text("Fourat"),
                            Text("Fourat"),
                            Text("fourat@mail.com"),
                            Text("20600200"),
                            Row(
                              children: [
                                Icon(
                                  LineIcons.eye,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  LineIcons.trash,
                                  color: Colors.redAccent,
                                )
                              ],
                            )
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
