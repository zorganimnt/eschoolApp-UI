
  import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/view/dashboard/home/screens/parents/menu/menu_items.dart';
import 'package:eschoolapp/view/dashboard/home/widgets/menu_item_widget.dart';
import 'package:flutter/material.dart';

Container buildParentMenu(BuildContext context, dashboardController) {
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
                for (int index = 0;
                    index < listDashboardParentKeys.length;
                    index++)
                  Column(
                    children: [
                      MenuItemWidget(
                        dashboardController: dashboardController,
                        pageIndex: index,
                        text: listDashboardParentKeys[index],
                        icon: listIconParentKeys[index],
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