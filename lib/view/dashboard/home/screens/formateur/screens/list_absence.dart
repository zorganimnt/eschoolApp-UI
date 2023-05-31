import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart';

import '../../../../../auth/components/select absent.dart';


class ListAbsence extends StatelessWidget {
  ListAbsence({super.key});

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
                                "Liste des absences",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 350,
                                child: WidgetTextField(
                                    context: context,
                                    label: "Recherche",
                                    hintText: "Rechercher un apprenant",
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
                                        "ID",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Nom",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Prénom",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "E-mail",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Numéro de téléphone",
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
                                        Text("1"),
                                        Text("Ben Ammar"),
                                        Text("Rania"),
                                        Text("Rania@gmail.com"),
                                        Text("26023212"),
                                       Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              SizedBox(
                                width: 1,
                              ),
                              absent(),
                            ],
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
                                        Text("2"),
                                        Text("Abidi"),
                                        Text("Jihene"),
                                        Text("jihene@gmail.com"),
                                        Text("50123658"),
                                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              SizedBox(
                                width: 1,
                              ),
                              absent(),
                            ],
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
                                        Text("3"),
                                        Text("Ben Ammar"),
                                        Text("Rayen"),
                                        Text("Rayen@gmail.com"),
                                        Text("23154753"),
                                        
                                       Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              SizedBox(
                                width: 1,
                              ),
                              absent(),
                            ],
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