import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:fl_chart/fl_chart.dart';
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
                                  onChanged: (value) {
                                     value==""? controller.getUsers('all') : 
                                    controller.searchUser();
                                   
                                  },
                                  controller: controller.searchEmail,
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
                                              color: colorByRole(
                                                  controller.role[index]),
                                              width: double.infinity,
                                              height: 50,
                                              child: Row(
                                                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Text(controller.id[index].toString()),
                                                    Text(controller.nom[index]),
                                                    Text(controller.prenom[index]),
                                                    Text(controller.email[index]),
                                                    Text(controller.phone[index]),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            showInformationUser(
                                                              context,
                                                              controller.id[index],
                                                              controller.nom[index],
                                                              controller.prenom[index],
                                                              controller.phone[index],
                                                              controller.email[index],
                                                              controller.role[index],
                                                            );
                                                            controller.putValue(
                                                              controller.nom[index],
                                                              controller.prenom[index],
                                                              controller.phone[index],
                                                              controller.email[index],
                                                            );
                                                          },
                                                          child: Icon(
                                                            LineIcons.eye,
                                                            color: Colors
                                                                .grey.shade800,
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            showConfirmationDelete(
                                                                context,
                                                                controller
                                                                    .id[index]);
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

  colorByRole(role) {
    switch (role) {
      case 'Apprenant':
        return Colors.orange.withOpacity(0.2);
      case 'Parent':
        return Colors.purple.withOpacity(0.2);
      case 'Employer':
        return Colors.red.withOpacity(0.2);
      case 'Formateur':
        return Colors.green.withOpacity(0.2);
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

  Future<void> showInformationUser(
      context, id, name, lastName, phone, email, role) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text(role),
          content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => ListBody(
                  children: [
                    ModifyInputItem(
                        initContent: name,
                        inputContent: controller.changedName.text,
                        inputLable: "Nom",
                        inputHintText: "Ex. Foulen",
                        inputIcon: LineIcons.user,
                        inputIndex: 1,
                        inputController: controller.changedName,
                        inChange: controller.nameInChange.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    ModifyInputItem(
                        initContent: lastName,
                        inputContent: controller.changeLastName.text,
                        inputLable: "Prénom",
                        inputHintText: "Ex. Ben Foulen",
                        inputIcon: LineIcons.user,
                        inputIndex: 2,
                        inputController: controller.changeLastName,
                        inChange: controller.lastNameInChnage.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    ModifyInputItem(
                        initContent: phone,
                        inputContent: controller.changePhone.text,
                        inputLable: "Phone",
                        inputHintText: "Ex. 21200300",
                        inputIcon: LineIcons.phone,
                        inputIndex: 3,
                        inputController: controller.changePhone,
                        inChange: controller.phoneInChange.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    ModifyInputItem(
                        initContent: email,
                        inputContent: controller.changeEmail.text,
                        inputLable: "E-mail",
                        inputHintText: "Ex. email@email.com",
                        inputIcon: LineIcons.envelope,
                        inputIndex: 4,
                        inputController: controller.changeEmail,
                        inChange: controller.emailInChange.value,
                        controller: controller),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 17.0),
                      child: Divider(
                        height: 2,
                      ),
                    ),
                    /*    ModifyInputItem(
                        inputContent: dateBirth,
                        inputLable: "Date de naissance",
                        inputHintText: "Ex. 20/2/2000",
                        inputIcon: LineIcons.birthdayCake,
                        inputIndex: 5,
                        inputController: controller.changeDateBirth,
                        inChange: controller.dateBirthInChange.value,
                        controller: controller), */
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
                      controller.updateUser(id); 
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
