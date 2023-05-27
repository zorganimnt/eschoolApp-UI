import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart';


class Listpaiement extends StatelessWidget {
  Listpaiement({super.key});

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
                                "Paiement",
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
                                        Checkbox(
                                          value: false, // Replace with your checkbox value variable
                                          onChanged: (newValue) {
                                            // Handle checkbox state changes
                                          },
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
                                        Text("iihene@gmail.com"),
                                        Text("50123658"),
                                        Checkbox(
                                          value: true, // Replace with your checkbox value variable
                                          onChanged: (newValue) {
                                            // Handle checkbox state changes
                                          },
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
                                        
                                        Checkbox(
                                          value: true, // Replace with your checkbox value variable
                                          onChanged: (newValue) {
                                            // Handle checkbox state changes
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),

                          /*Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                color: Colors.grey.withOpacity(0.3),
                                width: double.infinity,
                                height: 50,
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
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
                                        "Paiment",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "E-mail",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    
                                    ]),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        height: 50,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text("id"),
                                              Text("nom"),
                                           
                                              Text("ddd@email.com"),
                                              
                                              Row(
                                                children: [
                                                 Container(
                                                  height: 45,
                                                  width: 80,
                                                  child: Center(child: Text("Accepter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                                  decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(15)),
                                                 ), 
                                                 SizedBox(width: 8,), 
                                                   Container(
                                                     height: 45,
                                                     width: 80,
                                                  child: Center(child: Text("Refuser", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                                  decoration: BoxDecoration(color: Colors.red.shade700, borderRadius: BorderRadius.circular(15)),
                                                 ),
                                                ],
                                              )
                                            ]),
                                      );
                                    }),
                              )
                            ],
                          )
                        */],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

 
 
}