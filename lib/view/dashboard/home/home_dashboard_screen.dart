import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/dashboard/home/screens/acceui_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/cours_screen.dart';
import 'package:eschoolapp/view/dashboard/home/screens/list_absence.dart';
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

import '../../../controller/auth_controller.dart';

/*
class DashboardHomeScreen extends StatelessWidget {
  DashboardHomeScreen({super.key});

  final DashboardController dashboardController =
      Get.put(DashboardController());
  final AuthController authController = Get.put(AuthController());

  final List<Widget> _listDashboardAdminValues = <Widget>[
    AcceuilScreen(),
    ListUsers(),
    ListInscri(),
    ListFormation(),
     //ChatScreen(),
    ListAvis(),
    const PieChartSample1(),
    ProfileScreen(),
  ];

  final List<String> _listDashboardAdminKeys = <String>[
    "Acceuil",
    "Utilisateurs",
    "Inscriptions",
    "Formations",
    "Chat",
    "Avis",
    "Statistique",
    "Profil",
  ];

  final List<Widget> _dashboardEmployer = <Widget>[
    ListUsers(),
    ListInscri(),
    const ChatScreen(),
    ListAvis(),
    const PieChartSample1(),
  ];

  bool _isProfileBoxVisible = false;




  bool _isProfileBoxVisible = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (_) => Scaffold(
<<<<<<< HEAD
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
=======
                body: Stack(
              alignment: Alignment.topRight,
              children: [
                */
/*Visibility(
                    visible: _isProfileBoxVisible,
                    child: Container(color: Colors.yellow, width: 100, height: 100,),
                    ),*/ /*

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
                              // authController.roleUser == "Admin"
                              //     ?
                              _listDashboardAdminValues.elementAt(
                                      dashboardController.selectedIndex)
                                  // : _dashboardEmployer.elementAt(
                                  //     dashboardController.selectedIndex)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )));
>>>>>>> main
  }

  Row _buildHead(BuildContext context) {
    print("Role user : ${authController.roleUser}");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
                        const Text("Admin",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
<<<<<<< HEAD
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/icons/bb.jpg')),
=======
                  const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/icons/pdp1.png')),
>>>>>>> main
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
            authController.roleUser == 'Admin'
                ? Container(color: Colors.red)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int index = 0;
                          index < _listDashboardAdminKeys.length;
                          index++)
                        Column(
                          children: [
                            MenuItem(
                              dashboardController: dashboardController,
                              pageIndex: index,
                              text: _listDashboardAdminKeys[index],
                              icon: LineIcons.home,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),

          ],
        ),
      ),
    );
  }
}
*/

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({Key? key}) : super(key: key);

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen>
    with SingleTickerProviderStateMixin {
  final DashboardController dashboardController =
      Get.put(DashboardController());
  //final AuthController authController = Get.put(AuthController());

  final List<Widget> _listDashboardAdminValues = <Widget>[
    AcceuilScreen(),
    ListUsers(),
    ListInscri(),
    ListFormation(),
   //CoursScreen(),
    ListAbsence(),
    const PieChartSample1(),
    //StatScreen (),
    ProfileScreen(),
  ];

  final List<String> _listDashboardAdminKeys = <String>[
    "Acceuil",
    "Utilisateurs",
    "Inscriptions",
    "Formations",
    "Cours",
    "Absence",
    "Statistique",
    "Profil",
  ];

  final List<Widget> _dashboardEmployer = <Widget>[
    ListUsers(),
    ListInscri(),
    // CoursScreen(),
    ListAbsence(),
    const PieChartSample1(),
  ];

  late AnimationController _animationController;
  bool _isDropdownOpen = false;

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
      if (_isDropdownOpen) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) => GestureDetector(
        onTap: () => _isDropdownOpen? _toggleDropdown() : null,
        child: Scaffold(
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
                            // authController.roleUser == "Admin"
                            //     ?
                            _listDashboardAdminValues
                                .elementAt(dashboardController.selectedIndex)
                            // : _dashboardEmployer.elementAt(
                            //     dashboardController.selectedIndex)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: _isDropdownOpen,
                child: Positioned(
                  top: kToolbarHeight + 12,
                  right: 16,
                  child: SizeTransition(
                    sizeFactor: _animationController,
                    child: Card(
                      elevation: 8,
                      child: Container(
                        // color: Colors.grey.shade50,
                        width: MediaQuery.of(context).size.width * .15,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        // margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              onTap: () {
                                _toggleDropdown();
                                dashboardController.onChangeItem(7);
                                // print("3aza");
                              },
                              title: const Text('Profil'),
                            ),
                            ListTile(
                              onTap: () {
                                // Perform logout
                                // Add your logout logic here
                              },
                              title: const Text('Déconnexion', style: TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
        ),
      )
    );
  }

  Row _buildHead(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
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
          child: GestureDetector(
            onTap: () {
              // _isDropdownOpen = !_isDropdownOpen;
              _toggleDropdown();
            },
            child: SizedBox(
              width: 200,
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
                              'Jihene Abidi',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Text("Admin",
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/icons/pdp1.png')),
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
            dashboardController.roleUser == 'Admin'
                ? Container(color: Colors.red)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int index = 0;
                          index < _listDashboardAdminKeys.length;
                          index++)
                        Column(
                          children: [
                            MenuItem(
                              dashboardController: dashboardController,
                              pageIndex: index,
                              text: _listDashboardAdminKeys[index],
                              icon: LineIcons.home,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Divider(
                                height: 2,
                              ),
                            ),
                          ],
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
                print("index clicked = $pageIndex");
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
                  const SizedBox(
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
            : const SizedBox(),
      ],
    );
  }
}