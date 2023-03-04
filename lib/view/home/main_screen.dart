import 'package:eschoolapp/controller/home_controller.dart';
import 'package:eschoolapp/controller/parent_controller.dart';
import 'package:eschoolapp/model/parent.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/Parent/add_student_screen.dart';
import 'package:eschoolapp/view/Parent/get_students_screen.dart';
import 'package:eschoolapp/view/home/components/calendar_screen.dart';
import 'package:eschoolapp/view/home/components/documents_screen.dart';
import 'package:eschoolapp/view/home/components/home_screen.dart';
import 'package:eschoolapp/view/home/components/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MainScreeen extends StatelessWidget {
  MainScreeen({
    super.key,
  });
  final ParentController parentController = Get.put(ParentController());
  final HomeController controller = Get.put(HomeController());

  final List<Widget> _widgetContent = <Widget>[
    const HomeScreen(),
     CalendarScreen(),
    const DocumentsScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (_) {
      return Scaffold(
          bottomNavigationBar: _buildBottomAppBar(),
          appBar: buildAppBar(),
          drawer: buildDrawer(),
          body: _widgetContent.elementAt(controller.selectedIndex));
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      actions:  [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            icon: Stack(
              //alignment: AlignmentDirectional.topEnd,
              children: [
                Positioned(
                  top: 2,
                  left: 3.5,
                  child: CircleAvatar(
                
                   // child: Text("2"),
                    radius: 4.5,
                  backgroundColor: Colors.red,
                  ),
                ),
                SvgPicture.asset(
                  "assets/icons/notif-icon.svg",
                  width: 24.5,
                
                ),
              ],
            ),
            onPressed: () {
             // controller.onChangeItem(pageIndex);
            },
          ),
        )
      ],
      iconTheme: IconThemeData(color: Colors.black87,
      size: 24),
    );
  }

  BottomAppBar _buildBottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: SizedBox(
        height: 70,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            BottomNavItem(
              controller: controller,
              pageIndex: 0,
              icon: "assets/icons/btm_nv/home-icon.svg",
            ),
            BottomNavItem(
              controller: controller,
              pageIndex: 1,
              icon: "assets/icons/btm_nv/calendar-icon.svg",
            ),
            BottomNavItem(
              controller: controller,
              pageIndex: 2,
              icon: "assets/icons/btm_nv/document-icon.svg",
            ),
            BottomNavItem(
              controller: controller,
              pageIndex: 3,
              icon: "assets/icons/btm_nv/profile-icon.svg",
            ),
          ],
        ),
      ),
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
                  InkWell(
                    onTap: (() {
                      Get.to(ListChildrenScreen());
                    }),
                    child: const DrawerItem(
                      icon: Icons.list_rounded,
                      text: 'Liste mes enfants',
                    ),
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

class BottomNavItem extends StatelessWidget {
  final int pageIndex;
  final String icon;

  const BottomNavItem({
    Key? key,
    required this.controller,
    required this.pageIndex,
    required this.icon,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: SvgPicture.asset(
            icon,
            width: 28,
            color: controller.isSelected(pageIndex) ? Colors.deepPurple : null,
          ),
          onPressed: () {
            controller.onChangeItem(pageIndex);
          },
        ),
        controller.isSelected(pageIndex)
            ? CircleAvatar(
                radius: 2,
                backgroundColor: Colors.deepPurple,
              )
            : Container(),
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
