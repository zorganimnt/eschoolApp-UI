import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/validators.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../auth/components/pick_image.dart';

class AcceuilScreen extends StatelessWidget {
  AcceuilScreen({super.key});
  DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: acceuilAdmin(context),
    );
  }

  Column acceuilAdmin(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Les Utilisateurs",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                UserItemDashboard(
                  icon: LineIcons.user,
                  title: "Employer",
                  number: "200",
                  color: Colors.blue.shade900,
                  addPerson: true,
                  onAddPressed: () {
                    addEmp(context); 
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                UserItemDashboard(
                  icon: LineIcons.school,
                  color: Colors.orange.shade900,
                  title: "Formation",
                  number: "400",
                  addPerson: true,
                  onAddPressed: () {
                    addFormat(context);
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                UserItemDashboard(
                    icon: LineIcons.chalkboardTeacher,
                    title: "Formateur",
                    number: "230",
                    addPerson: true,
                    onAddPressed: () {},
                    color: Colors.pink.shade900),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserItemDashboard(
                    icon: LineIcons.user,
                    addPerson: true,
                    onAddPressed: () {},
                    title: "Parent",
                    number: "100",
                    color: Colors.purple.shade900),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Les Inscriptions",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserItemDashboard(
                    icon: LineIcons.user,
                    title: "Accepter",
                    number: "20",
                    color: Colors.teal.shade900),
                SizedBox(
                  width: 20,
                ),
                UserItemDashboard(
                    icon: LineIcons.school,
                    title: "Rejeter",
                    number: "4d0",
                    color: Colors.red.shade900),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Future<void> addEmp(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text("Ajouter Employer"),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListBody(children: [
              WidgetTextField(
                  validator: Validators.validateName,
                  controller: controller.nameEmp,
                  context: context,
                  hintText: "Ex. Foulen",
                  label: "Nom",
                  icon: LineIcons.user),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validateLastName,
                  controller: controller.lastNameEmp,
                  context: context,
                  hintText: "Ex. Ben Foulen",
                  label: "Prénom",
                  icon: LineIcons.user),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validatePhoneNumber,
                  controller: controller.telEmp,
                  context: context,
                  hintText: "Ex. 20100200",
                  label: "Numéro de téléphone",
                  icon: LineIcons.phone),
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
                  controller: controller.emailEmp,
                  context: context,
                  hintText: "Ex. exemple@email.com",
                  label: "Adresse E-mail",
                  icon: LineIcons.envelope),
              SizedBox(
                height: 15,
              ),
              WidgetTextField(
                  validator: Validators.validatePassword,
                  controller: controller.passEmp,
                  context: context,
                  hintText: "XXXXX",
                  label: "Mot de passe",
                  isPassword: true,
                  icon: LineIcons.lock),
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
                     controller.addEmployer(); 
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
                  hintText: "E-mail formateur",
                  label: "Adresse E-mail",
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

class UserItemDashboard extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String number;
  final Color? color;
  final bool addPerson;
  final void Function()? onAddPressed;

  const UserItemDashboard({
    Key? key,
    this.icon,
    required this.title,
    required this.number,
    this.color = Colors.blueAccent,
    this.addPerson = false,
    this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        child: Icon(
                          icon,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
                addPerson
                    ? IconButton(
                        onPressed: onAddPressed,
                        icon: Icon(
                          LineIcons.userPlus,
                          color: Colors.white,
                        ))
                    : SizedBox()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  number,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
      width: 220,
      height: 120,
      decoration: BoxDecoration(
          color: color!.withOpacity(0.85),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
