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
        child: Column(
          children: [
            if (controller.roleCurrentUser.value == "Admin")
              acceuilAdmin(context),
            if (controller.roleCurrentUser.value == "Formateur")
              acceuilFormateur(context),
            if (controller.roleCurrentUser.value == "Employer")
              acceuilEmployer(context),
            if (controller.roleCurrentUser.value == "Apprenant")
              acceuilApprenant(context),
            if (controller.roleCurrentUser.value == "Parent")
              acceuilParent(context)
          ],
        ));
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
                  icon: LineIcons.user,
                  color: Colors.orange.shade900,
                  title: "Apprenant",
                  number: "400",
                 
                ),
                SizedBox(
                  width: 20,
                ),
                UserItemDashboard(
                    icon: LineIcons.chalkboardTeacher,
                    title: "Formateur",
                    number: "230",
                    color: Colors.pink.shade900),

                     SizedBox(
                  width: 20,
                ),
                UserItemDashboard(
                    icon: LineIcons.peopleCarry,
                    title: "Parent",
                    number: "100",
                    color: Color.fromARGB(255, 92, 9, 170)),
              ],
            ),
          
          ],
        ),
        SizedBox(
          height: 90,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Les Formations",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                UserItemDashboard(
                    icon: LineIcons.laptop,
                    title: "Informatique",
                    number: "3",
                    color: Color.fromARGB(255, 180, 41, 106)),
                SizedBox(
                  width: 20,
                ),
                UserItemDashboard(
                    icon: LineIcons.digitalTachograph,
                    title: "Marketing",
                    number: "2",
                    color: Color.fromARGB(255, 52, 119, 182)),
                     SizedBox(
                  width: 20,
                ),
                UserItemDashboard(
                    icon: LineIcons.photoVideo,
                    title: "Design",
                    number: "5",
                    color: Color.fromARGB(255, 64, 183, 28)),
              ],
            ),
            
          ],
        ),
      ],
    );
    
  }

  Column acceuilApprenant(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cher apprenant bienvenue à notre centre de formation ",
             
              style: TextStyle( fontSize: 25, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
           
          ],
        ),
         Container(
                    width: 670,
                    height: 460,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/apprenant.png'),
                            fit: BoxFit.cover)),
                           
                  ),
       
      
       
      ],
    );
  }

  Column acceuilEmployer(BuildContext context) {
     return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        
        
         Container(
                    width: 1000,
                    height: 510,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/empemp.jpg'),
                            fit: BoxFit.cover)),
                           
                  ),
       
      
       
      ],
    );
  }

  Column acceuilFormateur(BuildContext context) {
     return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenue parmi notre équipe on compte sur vous pour réussir la formation",
             
              style: TextStyle( fontSize: 25, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
           
          ],
        ),
         Container(
                    width: 840,
                    height: 460,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/form.png'),
                            fit: BoxFit.cover)),
                           
                  ),
       
      
       
      ],
    );
  }

  Column acceuilParent(BuildContext context) {
   return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Vous êtes le bienvenue chez notre centre ESCHOOL",
             
              style: TextStyle( fontSize: 25, fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
           
          ],
        ),
         Container(
                    width: 900,
                    height: 450,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/acc parent.PNG'),
                            fit: BoxFit.cover)),
                           
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
                    child: Text("Annuler")),
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
                    child: Text("Annuler")),
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
