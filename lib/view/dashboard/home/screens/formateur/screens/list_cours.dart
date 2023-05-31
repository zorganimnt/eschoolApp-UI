
import 'package:eschoolapp/controller/cours_controller.dart';
import 'package:eschoolapp/utils/validators.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';


class Cours extends StatelessWidget {
   Cours({super.key});
  
final CoursController controller = Get.put(CoursController());

  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        
              body : Padding( 
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
                                "Liste des cours",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                             InkWell(
                                    onTap: () {
                                        addCours(context, controller);
                                        },
                                        child: Container(
                                          height: 30,
                                          width: MediaQuery.of(context).size.width * .1 ,
                                          child: Center(child: Text("+ Ajouter Cours", style: TextStyle(color: Color.fromARGB(255, 35, 89, 190), fontWeight: FontWeight.bold),)),
                                          decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(15)),
                                          ), 
                                     ),
                              // SizedBox(
                              //   width: 350,
                              //   child: WidgetTextField(
                              //     onChanged: (value) {
                              //      value==""? controller.getCours('all') :  controller.searchFormation(value); 
                              //     },
                                 
                              //       context: context,
                              //       label: "Recherche",
                              //       hintText: "Rechercher une formation",
                              //       icon: LineIcons.search),
                              // ),
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
                                        "Titre Cours",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Id Formation",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Description",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Support",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                    itemCount: controller.id_cours.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                              width: double.infinity,
                                              height: 50,
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(controller.id_cours[index].toString()),
                                                    Text(controller.formation_id[index].toString()),
                                                    Text(controller.nom_cours[index]),
                                                    Text(controller.description_cours[index]),
                                                    Text(controller.support_cours[index]),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            showInformationUser(
                                                              context,
                                                              controller.id_cours[index],
                                                              controller.formation_id[index],
                                                              controller.nom_cours[index],
                                                              controller.description_cours[index],
                                                              controller.support_cours[index],
                                                              controller
                                                            );
                                                            controller.putValue(
                                                              controller.formation_id[index],
                                                              controller.nom_cours[index],
                                                              controller.description_cours[index],
                                                              controller.support_cours[index],
                                                            );
                                                          },
                                                          child: Icon(
                                                            LineIcons.eye,
                                                            color: Colors.grey.shade800,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            showConfirmationDelete(
                                                              context,controller.id_cours[index], controller);
                                                          },
                                                          child: Icon(
                                                            LineIcons.trash,
                                                            color: Colors
                                                                .redAccent,
                                                          ),
                                                        ),
                                                        
                                                      ],
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
  
                          // DataTable(
                          //   columns: controller.columns,
                          //   rows: controller.rows,
                          // ),

} 
Future<void> addCours(context, controller) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text("Ajouter Formation"),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListBody(children: [
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.nameCours,
                  context: context,
                  hintText: "Nom du cours",
                  label: "Nom du cours",
                  icon: LineIcons.graduationCap),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.idFormation,
                  context: context,
                  hintText: "id de formation",
                  label: "id de formation",
                  icon: LineIcons.userGraduate),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.descriptionCours,
                  context: context,
                  hintText: "description du cours",
                  label: "description du cours",
                  icon: LineIcons.calendarTimes),
                        SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.supportCours,
                  context: context,
                  hintText: "support du cours",
                  label: "support du cours",
                  icon: LineIcons.tag),
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
                     controller.addCours(); 
                     //controller.getFormation("all");
                    },
                    child: Text("Confirmer")),
              ],
            )
          ],
        );
      },
    );
  }
  
  Future<void> showConfirmationDelete(context, id , controller) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text("Voulez vous supprimer ce cours ?")],
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
                    child: Text("Annuler")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller.deleteCours(id);
                      controller.getCours("all");
                    },
                    child: Text("Confirmer")),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> showInformationUser(
      context, id, name, idformation, description, support, controller) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => ListBody(
                  children: [
                    ModifyInputItem(
                        initContent: name,
                        inputContent: controller.changedNameCours.text,
                        inputLable: "Nom du cours",
                        inputHintText: "Ex. Développement web",
                        inputIcon: LineIcons.user,
                        inputIndex: 1,
                        inputController: controller.changedNameCours,
                        inChange: controller.nameCoursInChange.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    ModifyInputItem(
                        initContent: idformation,
                        inputContent: controller.changedidFormation.text,
                        inputLable: "Prénom",
                        inputHintText: "Ex. Ben Foulen",
                        inputIcon: LineIcons.user,
                        inputIndex: 2,
                        inputController: controller.changedidFormation,
                        inChange: controller.idFormationInChnage.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    ModifyInputItem(
                        initContent: description,
                        inputContent: controller.changeddescriptionCours.text,
                        inputLable: "Phone",
                        inputHintText: "Ex. 21200300",
                        inputIcon: LineIcons.phone,
                        inputIndex: 3,
                        inputController: controller.changeddescriptionCours,
                        inChange: controller.descriptionCoursInChange.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    ModifyInputItem(
                        initContent: support,
                        inputContent: controller.changedsupportCours.text,
                        inputLable: "E-mail",
                        inputHintText: "Ex. email@email.com",
                        inputIcon: LineIcons.envelope,
                        inputIndex: 4,
                        inputController: controller.changedsupportCours,
                        inChange: controller.supportCoursInChange.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                  ],
                ),
              )),
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
                      controller.updateCours(id); 
                      controller.getCours("all");
                    },
                    child: Text("Confirmer")),
              ],
            )
          ],
        );
      },
    );
}
  

class ModifyInputItem extends StatelessWidget {
  final CoursController controller;
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
                  controller.modifyCours(inputIndex);
                  // print(controller.nameInChange.value);
                },
                child: Icon(LineIcons.check))
            : InkWell(
                onTap: () {
                  controller.modifyCours(inputIndex);
                  // print(controller.nameInChange.value);
                },
                child: Icon(LineIcons.edit))
      ],
    );
  }}