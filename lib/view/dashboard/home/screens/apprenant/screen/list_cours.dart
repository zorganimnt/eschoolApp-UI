import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/controller/profile_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:http/http.dart';
import '../../../../../../routes/app_routes.dart';


class voircours extends StatelessWidget {
  voircours({super.key});

  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        
              body : Padding( padding: const EdgeInsets.all(12.0),
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
                            
InkWell(
                                                onTap: () {
                                                  Get.toNamed(AppRoutes.formationapp);
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: MediaQuery.of(context).size.width * .1,
                                                  decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Icon(
      Icons.arrow_back,
      color: Color.fromARGB(255, 97, 147, 223),
      size: 24,
    ),
  ),
),
                              Text(
                                "Liste des Cours",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 350,
                                child: WidgetTextField(
                                    context: context,
                                    label: "Recherche",
                                    hintText: "Rechercher un cours",
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
                                        "Description",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      
                                      Text(
                                        "Support du cours",
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
                                       Text("Php"),
                                        Text("Cours qui contient PHP"),
                                       Row(
      
      children: [
        Icon(Icons.picture_as_pdf), // Icône PDF
         // Espacement entre l'icône et le checkbox
        
      ],
    ),

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
                                       Text("Html"),
                                        Text("Cours qui contient Html"),
                                       Row(
      children: [
        Icon(Icons.picture_as_pdf), // Icône PDF
        // Espacement entre l'icône et le checkbox
        
      ],
    ),
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
                                       Text("Css"),
                                        Text("Cours qui contient Css"),
                                        

                                    // Espacement entre les deux colonnes
    Row(
      
      children: [
        Icon(Icons.picture_as_pdf), // Icône PDF
         // Espacement entre l'icône et le checkbox
        
      ],
    ),
          
            
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
                            ],
                          ),
                         ],
                      ),
                    ),
                  ),
                ),
              ),
      ),  );
  }

 
 
}

