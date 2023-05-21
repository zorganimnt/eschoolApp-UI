import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final int pageIndex;

  const MenuItemWidget(
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