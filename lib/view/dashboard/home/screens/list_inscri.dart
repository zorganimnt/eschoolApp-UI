import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import 'package:eschoolapp/utils/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:line_icons/line_icons.dart';

class ListInscri extends StatelessWidget {
  ListInscri({super.key});

  final DashboardController controller = Get.put(DashboardController());
  final Map<String, dynamic> _mapController = {};

  @override
  Widget build(BuildContext context) {
    _mapController["id"] = controller.id;
    _mapController["nom"] = controller.nom;
    _mapController["prenom"] = controller.prenom;
    _mapController["email"] = controller.email;
    _mapController["phone"] = controller.phone;
  
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
                                "Liste des inscriptions",
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
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    itemCount: controller.id.length,
                                    itemBuilder: (context, index) {
                                      return controller.role[index] == 'Admin'
                                          ? SizedBox()
                                          : Container(  
                                              color: Colors.white30,
                                              width: double.infinity,
                                              height: 50,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                          
                                                  children: [
                                                    
                                                    Text(_mapController["id"][index]
                                                        .toString()),
                                                    Text(_mapController["nom"][index]),
                                                    Text(_mapController["prenom"][index]),
                                                    Text(_mapController["email"][index]),
                                                    Text(_mapController["phone"][index]),

                                                    
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            showConfirmationAccept(
                                                                context,
                                                                controller
                                                                    .id[index]);
                                                          },
                                                          child: Container(
                                                            height: 30,
                                                  width: 70,
                                                  child: Center(child: Text("Accepter", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                                  decoration: BoxDecoration(color: Colors.green.shade700, borderRadius: BorderRadius.circular(15)),
                                                          ),
                                                        ), 

                                                        SizedBox(width: 8,),

                                                        InkWell(
                                                          onTap: () {
                                                            showConfirmationDelete(
                                                                context,
                                                                controller
                                                                    .id[index]);
                                                          },
                                                          child: Container(
                                                           height: 30,
                                                     width: 70,
                                                  child: Center(child: Text("Refuser", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                                                  decoration: BoxDecoration(color: Colors.red.shade700, borderRadius: BorderRadius.circular(15)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    
                                                  ]),
                                            );
                                    }),
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

  Future<void> showConfirmationDelete(context, id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text("Voulez vous Réfuser cet utilistauer ?")],
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

   Future<void> showConfirmationAccept(context, id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text("Voulez vous vraiment accepter cet utilistauer ?")],
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


 
}


class ModifyInputItem extends StatelessWidget {
  final bool inChange;
  final TextEditingController? inputController;
  final String inputLable;
  final String inputHintText;
  final IconData? inputIcon;
  final String inputContent;
  final String? initContent;
  final int inputIndex;
  const ModifyInputItem({
    Key? key,
    required this.controller,
    required this.inChange,
    this.inputController,
    required this.inputLable,
    required this.inputHintText,
    this.inputIcon,
    required this.inputContent,
    required this.inputIndex,
    this.initContent,
  }) : super(key: key);

  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        inChange
            ? SizedBox(
                width: 180,
                child: WidgetTextField(
                    // initialValue: "initContent",
                    controller: inputController,
                    context: context,
                    label: inputLable,
                    hintText: inputHintText,
                    icon: inputIcon),
              )
            : Row(
                children: [
                  Icon(inputIcon),
                  SizedBox(
                    width: 4,
                  ),
                  Text(inputContent),
                ],
              ),
        inChange
            ? InkWell(
                onTap: () {
                  controller.modifyUser(inputIndex);
                  // print(controller.nameInChange.value);
                },
                child: Icon(LineIcons.check))
            : InkWell(
                onTap: () {
                  controller.modifyUser(inputIndex);
                  // print(controller.nameInChange.value);
                },
                child: Icon(LineIcons.edit))
      ],
    );
  }
}
