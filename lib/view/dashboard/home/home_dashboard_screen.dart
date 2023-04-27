import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/dashboard/home/screens/acceui_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/chat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_avis.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_formation.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_inscri.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_users.dart';
import 'package:eschoolapp/view/dashboard/home/screens/stat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/test_stat.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class DashboardHomeScreen extends StatelessWidget {
  DashboardHomeScreen({super.key});
  final DashboardController dashboardController =
      Get.put(DashboardController());

  final List<Widget> _dashboardAdmin = <Widget>[
    const AcceuilScreen(),
    ListUsers(
    
    ),
    const ListInscri(),
    const ListFormation(),
    const ChatScreen(),
    const ListAvis(),
     PieChartSample1()
  ];

  final List<Widget> _dashboardEmployer = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (_) => Scaffold(
              body: Row(
                children: [
                  _buildMenu(context),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.05)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          _buildHead(context),
                          _dashboardAdmin
                              .elementAt(dashboardController.selectedIndex)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }

  Row _buildHead(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tableau de board',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Text(
              'Gestionner votre site web EschoolApp',
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        SizedBox(
          width: 430,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/icons/pdp1.png')),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jihene Abidi",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(
                            Icons.verified,
                            size: 17,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                      Text("Admin",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 150,
                  height: 50,
                  child: Center(
                    child: Text(
                      "Modifier profile",
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: primaryColor, spreadRadius: 0.5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Container _buildMenu(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.2,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.17)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Image.asset(
              'assets/icons/logo-app.png',
              width: 250,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MenuItem(
                dashboardController: dashboardController,
                pageIndex: 0,
                text: "Acceuil",
                icon: LineIcons.home,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 2,
                ),
              ),
              MenuItem(
                dashboardController: dashboardController,
                pageIndex: 1,
                text: "Utilisateurs",
                icon: LineIcons.users,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 2,
                ),
              ),
              MenuItem(
                dashboardController: dashboardController,
                pageIndex: 2,
                text: "Inscription",
                icon: LineIcons.list,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 2,
                ),
              ),
              MenuItem(
                dashboardController: dashboardController,
                pageIndex: 3,
                text: "Formation",
                icon: LineIcons.school,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 2,
                ),
              ),
              MenuItem(
                dashboardController: dashboardController,
                pageIndex: 4,
                text: "Chat",
                icon: LineIcons.facebookMessenger,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 2,
                ),
              ),
              MenuItem(
                dashboardController: dashboardController,
                pageIndex: 5,
                text: "Avis",
                icon: LineIcons.star,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  height: 2,
                ),
              ),
              MenuItem(
                dashboardController: dashboardController,
                pageIndex: 6,
                text: "Statistique",
                icon: LineIcons.percentage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final int pageIndex;

  const MenuItem(
      {Key? key,
      required this.dashboardController,
      required this.text,
      required this.icon,
      required this.pageIndex})
      : super(key: key);

  final DashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: InkWell(
              onTap: () {
                dashboardController.onChangeItem(pageIndex);
              },
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: dashboardController.isSelected(pageIndex)
                        ? primaryColor
                        : Colors.black87,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: dashboardController.isSelected(pageIndex)
                            ? primaryColor
                            : Colors.black87),
                  )
                ],
              )),
        ),
        dashboardController.isSelected(pageIndex)
            ? Container(
                height: 20,
                width: 2.8,
                color: primaryColor,
              )
            : SizedBox(),
      ],
    );
  }
}
