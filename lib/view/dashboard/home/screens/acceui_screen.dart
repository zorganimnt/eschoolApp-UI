import 'package:eschoolapp/view/dashboard/home/screens/add_employer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AcceuilScreen extends StatelessWidget {
  const AcceuilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          Get.to(AddEmployer()); 
        },
        child: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LineIcons.plus),
                Text(
                  'Ajouter Employer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          width: 220,
          height: 100,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(blurRadius: 1, spreadRadius: 0.2, color: Colors.grey)
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
