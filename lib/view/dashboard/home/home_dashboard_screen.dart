import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/dashboard/home/screens/acceui_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/chat_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_avis.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_formation.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_inscri.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_users.dart';
import 'package:eschoolapp/view/dashboard/home/screens/profile_screen.dart';
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
    AcceuilScreen(),
    ListUsers(),
    ListInscri(),
    ListFormation(),
     //ChatScreen(),
    ListAvis(),
    PieChartSample1(),
    ProfileScreen()
  ];

  final List<Widget> _dashboardEmployer = <Widget>[];




  bool _isProfileBoxVisible = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (_) => Scaffold(
              body: Stack(
                alignment: Alignment.topRight,
                children: [
                  
                  Row(  
                children: [
                  _buildMenu(context),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration:
                        BoxDecoration(color: Colors.grey.withOpacity(0.05)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildHead(context),
                            _dashboardAdmin
                                .elementAt(dashboardController.selectedIndex)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            
                ],
              )));
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
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              _isProfileBoxVisible = !_isProfileBoxVisible;
              dashboardController.onChangeItem(7);
            },
            child: SizedBox(
              //color: Colors.red,
              width: MediaQuery.of(context).size.width * .22,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: const [
                            Icon(
                              Icons.verified,
                              size: 17,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Rania Ben Ammar',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text("Admin",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/icons/bb.jpg')),
                ],
              ),
            ),
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
      child: SingleChildScrollView(
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
