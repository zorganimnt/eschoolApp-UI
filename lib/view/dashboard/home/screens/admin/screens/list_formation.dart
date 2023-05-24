import 'package:eschoolapp/controller/formation_controller.dart';
import 'package:eschoolapp/view/auth/components/pick_image.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:eschoolapp/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ListFormation extends StatelessWidget {
  ListFormation({super.key});

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
                              InkWell(
                                onTap: () {
                                  addFormat(context);
                                },
                                child: Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width * .1,
                                  child: Center(
                                      child: Text(
                                    "+ Ajouter Formation",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 77, 144, 239),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              SizedBox(
                                width: 350,
                                child: WidgetTextField(
                                    onChanged: (value) {
                                      value == ""
                                          ? controller.getFormation('all')
                                          : controller.searchFormation(value);
                                    },
                                    context: context,
                                    label: "Recherche",
                                    hintText: "Rechercher une formation",
                                    icon: LineIcons.search),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DataTable(
                            columns: controller.columns,
                            rows: controller.rows,
                          ),

                          /*  Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        height: 50,
                                        child: Row(
                                    
                                            children:  [
                                              Text(controller.id[index].toString()),
                                              Text(controller.title[index]),
                                              SizedBox(width: 30,), 
                                              Text(controller.formateur[index].toString()),
                                           SizedBox(width: 30,), 
                                              Text(controller.duree[index]),
                                              Text('${controller.price[index]}DT'),
                                              Text("modifier"),
                                            ]),
                                      ); */

                          SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                                itemCount: controller.id.length,
                                itemBuilder: (context, index) {
                                  return controller.role[index] == 'Admin'
                                      ? SizedBox()
                                      : Container(
                                          width: double.infinity,
                                          height: 50,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(controller.id[index]
                                                    .toString()),
                                                Text(controller
                                                    .formationnom[index]),
                                                Text(controller
                                                    .formationphoto[index]),
                                                // Text(controller.formationprix[index]),
                                                Text(controller
                                                    .formationformateur[index]),
                                                Text(controller
                                                    .formationformateur[index]),
                                                Text(controller
                                                    .formationduree[index]),
                                                Text(controller
                                                    .formationcategory[index]),

                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        showInformationFormation(
                                                          context,
                                                          controller.id[index],
                                                          controller
                                                                  .formationnom[
                                                              index],
                                                          controller
                                                                  .formationphoto[
                                                              index],
                                                          controller
                                                                  .formationprix[
                                                              index],
                                                          controller
                                                                  .formationformateur[
                                                              index],
                                                          controller
                                                                  .formationduree[
                                                              index],
                                                          controller
                                                                  .formationcategory[
                                                              index],
                                                          controller
                                                              .role[index],
                                                        );
                                                        controller.putValue(
                                                          controller
                                                                  .formationnom[
                                                              index],
                                                          controller
                                                                  .formationphoto[
                                                              index],
                                                          controller
                                                                  .formationprix[
                                                              index],
                                                          controller
                                                                  .formationformateur[
                                                              index],
                                                          controller
                                                                  .formationduree[
                                                              index],
                                                          controller
                                                                  .formationcategory[
                                                              index],
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
                                                        Icons.close,
                                                        color: Colors.redAccent,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ]),
                                        );
                                }),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  Future<void> showInformationFormation(
      context,
      id,
      nameFormation,
      pictureFormation,
      priceFormation,
      formateurFormation,
      dureeFormation,
      categoryFormation,
      role) async {
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
                () {
                  return ListBody(
                    children: [
                      ModifyInputItem(
                          initContent: pictureFormation,
                          inputContent: controller.changePictureFormation.text,
                          inputLable: "P",
                          inputHintText: "Ex. Ben Foulen",
                          inputIcon: LineIcons.user,
                          inputIndex: 2,
                          inputController: controller.changePictureFormation,
                          inChange: controller.PictureFormationInChnage.value,
                          controller: controller),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                      ModifyInputItem(
                          initContent: nameFormation,
                          inputContent: controller.changeNameFormation.text,
                          inputLable: "Nom du formation",
                          inputHintText: "Nom du formation",
                          inputIcon: LineIcons.graduationCap,
                          inputIndex: 1,
                          inputController: controller.changeNameFormation,
                          inChange: controller.nameFormationInChange.value,
                          controller: controller),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                      ModifyInputItem(
                          initContent: categoryFormation,
                          inputContent: controller.changeCategoryFormation.text,
                          inputLable: "Catégorie de formation",
                          inputHintText: "Catégorie de formation",
                          inputIcon: LineIcons.userGraduate,
                          inputIndex: 3,
                          inputController: controller.changeCategoryFormation,
                          inChange: controller.CategoryFormationInChange.value,
                          controller: controller),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                      ModifyInputItem(
                          initContent: dureeFormation,
                          inputContent: controller.changeDureeFormation.text,
                          inputLable: "duree du formation",
                          inputHintText: "duree du formation",
                          inputIcon: LineIcons.calendarTimes,
                          inputIndex: 3,
                          inputController: controller.changeDureeFormation,
                          inChange: controller.DureeFormationInChange.value,
                          controller: controller),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                      ModifyInputItem(
                          initContent: priceFormation,
                          inputContent: controller.changePriceFormation.text,
                          inputLable: "prix du formation",
                          inputHintText: "prix du formation",
                          inputIcon: LineIcons.tag,
                          inputIndex: 3,
                          inputController: controller.changePriceFormation,
                          inChange: controller.PriceFormationInChange.value,
                          controller: controller),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                      ModifyInputItem(
                          initContent: formateurFormation,
                          inputContent:
                              controller.changeFormateurFormation.text,
                          inputLable: "E-mail du formateur",
                          inputHintText: "Ex. email@email.com",
                          inputIcon: LineIcons.envelope,
                          inputIndex: 4,
                          inputController: controller.changeFormateurFormation,
                          inChange: controller.FormateurFormationInChange.value,
                          controller: controller),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 17.0),
                        child: Divider(
                          height: 2,
                        ),
                      ),
                    ],
                  );
                },
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
                      controller.updateFormation(id);
                      controller.getFormation("all");
                    },
                    child: Text("Confirmer")),
              ],
            )
          ],
        );
      },
    );
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
              children: <Widget>[Text("Voulez vous supprimer cette formation")],
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
                      // controller.deleteUser(id);
                      controller.getFormation("all");
                    },
                    child: Text("Confirmer")),
              ],
            )
          ],
        );
      },
    );
  }

  Future<void> addFormat(context) async {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150, child: PickPhoto()),
                ],
              ),
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.titleFormation,
                  context: context,
                  hintText: "Nom du formation",
                  label: "Nom du formation",
                  icon: LineIcons.graduationCap),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.categoryFormation,
                  context: context,
                  hintText: "Catégorie de formation",
                  label: "Catégorie de formation",
                  icon: LineIcons.userGraduate),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.dureeFormation,
                  context: context,
                  hintText: "duree du formation",
                  label: "duree du formation",
                  icon: LineIcons.calendarTimes),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validateNotNullOrEmpty,
                  controller: controller.priceFormation,
                  context: context,
                  hintText: "prix du formation",
                  label: "prix du formation",
                  icon: LineIcons.tag),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 1.5,
              ),
              SizedBox(
                height: 20,
              ),
              WidgetTextField(
                  validator: Validators.validateEmail,
                  controller: controller.formateurFormation,
                  context: context,
                  hintText: "Nom formateur",
                  label: "Nom formateur",
                  icon: LineIcons.envelope),
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
                    child: Text("Anuller")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      controller.addFormation();
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
}

class ModifyInputItem extends StatelessWidget {
  final FormationController controller;
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
                  controller.modifyFormation(inputIndex);
                  // print(controller.nameInChange.value);
                },
                child: Icon(LineIcons.check))
            : InkWell(
                onTap: () {
                  controller.modifyFormation(inputIndex);
                  // print(controller.nameInChange.value);
                },
                child: Icon(LineIcons.edit))
      ],
    );
  }
}
