import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/dashboard/home/screens/Apprenant/menu/menu_items.dart';
import 'package:eschoolapp/view/dashboard/home/screens/Formateur/menu/menu_items.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/menu/menu.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/menu/menu_items.dart';
import 'package:eschoolapp/view/dashboard/home/screens/apprenant/menu/menu.dart';
import 'package:eschoolapp/view/dashboard/home/screens/employer/menu/meni_items.dart';
import 'package:eschoolapp/view/dashboard/home/screens/employer/menu/menu.dart';
import 'package:eschoolapp/view/dashboard/home/screens/formateur/menu/menu.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/menu/menu.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/menu/menu_items.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/menu_item_widget.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/test_stat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class DashboardHomeScreen extends StatefulWidget {
  const DashboardHomeScreen({Key? key}) : super(key: key);

  @override
  State<DashboardHomeScreen> createState() => _DashboardHomeScreenState();
}

class _DashboardHomeScreenState extends State<DashboardHomeScreen>
    with SingleTickerProviderStateMixin {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (_) => GestureDetector(
              onTap: () => _isDropdownOpen ? _toggleDropdown() : null,
              child: Scaffold(
                body: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Row(
                      children: [
                        if (dashboardController.roleCurrentUser.value ==
                            'Admin')
                          buildAdminMenu(context, dashboardController),
                        if (dashboardController.roleCurrentUser.value ==
                            'Employer')
                          buildEmployerMenu(context, dashboardController),
                        if (dashboardController.roleCurrentUser.value ==
                            'Formateur')
                          buildFormateurMenu(context, dashboardController),
                        if (dashboardController.roleCurrentUser.value ==
                            'Parent')
                          buildParentMenu(context, dashboardController),
                        if (dashboardController.roleCurrentUser.value ==
                            'Apprenant')
                          buildApprenantMenu(context, dashboardController),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.05)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  _buildHead(context),
                                  if (dashboardController
                                          .roleCurrentUser.value ==
                                      'Admin')
                                    listDashboardAdminValues.elementAt(
                                        dashboardController.selectedIndex),
                                  if (dashboardController
                                          .roleCurrentUser.value ==
                                      'Employer')
                                    listDashboardEmployerValues.elementAt(
                                        dashboardController.selectedIndex),
                                  if (dashboardController
                                          .roleCurrentUser.value ==
                                      'Formateur')
                                    listDashboardFormateurValues.elementAt(
                                        dashboardController.selectedIndex),
                                  if (dashboardController
                                          .roleCurrentUser.value ==
                                      'Parent')
                                    listDashboardParentValues.elementAt(
                                        dashboardController.selectedIndex),
                                  if (dashboardController
                                          .roleCurrentUser.value ==
                                      'Apprenant')
                                    listDashboardApprenantValues.elementAt(
                                        dashboardController.selectedIndex),
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
                                      switch (dashboardController
                                          .roleCurrentUser.value) {
                                        case 'Admin':
                                          dashboardController.onChangeItem(
                                              listDashboardAdminValues.length -
                                                  1);
                                          break;
                                        case 'Employer':
                                          dashboardController.onChangeItem(
                                              listDashboardEmployerValues
                                                      .length -
                                                  1);
                                          break;
                                        case 'Formateur':
                                          dashboardController.onChangeItem(
                                              listDashboardFormateurValues
                                                      .length -
                                                  1);
                                          break;
                                        case 'Parent':
                                          dashboardController.onChangeItem(
                                              listDashboardParentValues.length -
                                                  1);
                                          break;
                                        case 'Apprenant':
                                          dashboardController.onChangeItem(
                                              listDashboardApprenantValues
                                                      .length -
                                                  1);
                                          break;
                                      }
                                    },
                                    title: const Text('Profil'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Get.toNamed(AppRoutes.welcome);
                                    },
                                    title: const Text('Déconnexion',
                                        style: TextStyle(color: Colors.red)),
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
            ));
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
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              // _isDropdownOpen = !_isDropdownOpen;
              _toggleDropdown();
            },
            child: SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.verified,
                              size: 17,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${dashboardController.nameCurrentUser.value} ${dashboardController.lastNameCurrentUser.value}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Text(dashboardController.roleCurrentUser.value,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/icons/bb.jpg')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

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
}