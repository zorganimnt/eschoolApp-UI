import 'package:eschoolapp/controller/parent_controller.dart';
import 'package:eschoolapp/model/parent.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/Parent/add_student_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreeen extends StatelessWidget {
  final String? token;
  final String? role;
  HomeScreeen({super.key, this.token, this.role});
  final ParentController parentController = Get.put(ParentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        drawer: buildDrawer(),
        floatingActionButton: FloatingActionButton(onPressed: (() => parentController.getParentProfile())),
        // hedhi Obx Widget 3ibara bech tarbtelna bin controller w view
        // ay haja tsir fel controller hiya li yabda fibelha
        // soit info soit variable tbadel ....
        body: Obx((() => parentController.loading.value
            ? const CircularProgressIndicator()
            : Column(   
                children: [
                  Text("nom parent: "),
                  SelectableText(
                    parentController.parentModel.value.nameParent.toString(),
                  )
                ],
              ))));
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            child: Icon(
              Icons.notifications_outlined,
              color: Colors.grey,
              size: 25,
            ),
          ),
        )
      ],
      iconTheme: IconThemeData(color: primaryColor),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/icons/pdp.png"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kamel Ben Ammar",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.verified_rounded,
                        color: primaryColor,
                        size: 15,
                      )
                    ],
                  ),
                  Text(
                    "Parent",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
              separator(),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(AddStudentScreen());
                    },
                    child: const DrawerItem(
                      icon: Icons.person_add_rounded,
                      text: 'Ajouter un étudiant',
                    ),
                  ),
                  separator(),
                  const DrawerItem(
                    icon: Icons.list_rounded,
                    text: 'Liste mes enfants',
                  ),
                  separator(),
                  const DrawerItem(
                    icon: Icons.timer_outlined,
                    text: 'Avancement',
                  ),
                  separator(),
                  const DrawerItem(
                    icon: Icons.date_range_rounded,
                    text: 'Calenderier',
                  ),
                  separator(),
                  const DrawerItem(
                    icon: Icons.logout_rounded,
                    text: 'Déconnexion',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column separator() {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 1.5,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String text;
  const DrawerItem({
    Key? key,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 20),
            const SizedBox(
              width: 12,
            ),
            Text(
              text,
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: Colors.black87,
        )
      ],
    );
  }
}
