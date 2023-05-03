import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';

class ListUsers extends StatelessWidget {
  colorByRole(role) {
    print(role); 
    switch (role) {
      case 'Apprenant':
        return Colors.orange.withOpacity(0.5);
      case 'Parent':
        return Colors.purple.withOpacity(0.5);
      case 'Employer':
        return Colors.red.withOpacity(0.5);
      case 'Formateur':
        return Colors.green.withOpacity(0.5);
      default:
        return Colors.white; 
    }
  }

  Future<void> showConfirmationDelete(context, id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Confirmation"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text("Voulez vous supprimer cet utilistauer")],
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                
                  },
                  child: Text("Anuller")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    controller.deleteUser(id); 
                    controller.getUsers("all"); 
                    },
                  child: Text("Confirmer")),
            ],
          )
        ],
      );
    },
  );
}


  ListUsers({super.key});
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
                                "Liste des utilisateurs",
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
                                          borderRadius:
                                              BorderRadius.circular(15))
                                      : BoxDecoration(
                                          boxShadow: [
                                              BoxShadow(
                                                  color: Colors.deepOrange,
                                                  spreadRadius: 1)
                                            ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
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
                                          borderRadius:
                                              BorderRadius.circular(15))
                                      : BoxDecoration(
                                          boxShadow: [
                                              BoxShadow(
                                                  color: Colors.deepPurple,
                                                  spreadRadius: 1)
                                            ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    'Parent',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: controller.parentSelected
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
                                  decoration: controller.employerSelected
                                      ? BoxDecoration(
                                          color: Colors.red.shade800,
                                          borderRadius:
                                              BorderRadius.circular(15))
                                      : BoxDecoration(
                                          boxShadow: [
                                              BoxShadow(
                                                  color: Colors.red.shade800,
                                                  spreadRadius: 1)
                                            ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    'Employer',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: controller.employerSelected
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
                                          borderRadius:
                                              BorderRadius.circular(15))
                                      : BoxDecoration(
                                          boxShadow: [
                                              BoxShadow(
                                                  color: Colors.green.shade800,
                                                  spreadRadius: 1)
                                            ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                  child: Center(
                                      child: Text(
                                    'Formateur',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: controller.formateurSelected
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
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
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    itemCount: controller.id.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        color:
                                            colorByRole(controller.role[index]),
                                        width: double.infinity,
                                        height: 50,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(controller.id[index]
                                                  .toString()),
                                              Text(controller.nom[index]),
                                              Text(controller.prenom[index]),
                                              Text(controller.email[index]),
                                              Text(controller.phone[index]),
                                              InkWell(
                                                onTap: () {
                                                  showConfirmationDelete(context, controller.id[index]);
                                                },
                                                child: Icon(
                                                  LineIcons.trash,
                                                  color: Colors.redAccent,
                                                ),
                                              )
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
