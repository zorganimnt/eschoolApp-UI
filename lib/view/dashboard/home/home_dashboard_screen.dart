import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/dashboard/home/menu_dashboard.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/menu/menu.dart';
import 'package:eschoolapp/view/dashboard/home/screens/admin/menu/menu_items.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/menu_item_widget.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/test_stat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                        //_buildAdminMenu(context),
                      buildAdminMenu(context, dashboardController), 
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
                                  // authController.roleUser == "Admin"
                                  //     ?
                                  listDashboardAdminValues.elementAt(
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
                                      dashboardController.onChangeItem(
                                          listDashboardAdminValues.length - 1);
                                    },
                                    title: const Text('Profil'),
                                  ),
                                  ListTile(
                                    onTap: () {},
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


