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
        title: Text("Succés"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[Text("Inscription effectué avec succès")],
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("D'accord"))
        ],
      );
    },
  );
}
