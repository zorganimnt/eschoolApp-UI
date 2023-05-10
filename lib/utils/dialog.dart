import 'package:eschoolapp/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Future<void> showConfirmation(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Succées"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text("Inscription en cours de traitement")],
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
               // Get.offAllNamed(AppRoutes.welcome); 
              },
              child: Text("D'accord"))
        ],
      );
    },
  );
}
