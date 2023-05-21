
import 'package:eschoolapp/controller/formation_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class AddFormation extends StatelessWidget {
  AddFormation({super.key});
  final FormationController controller = Get.put(FormationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          WidgetTextField(
              controller: controller.photoFormation,
              context: context,
              hintText: "Ex. Foulen",
              label: "Nom",
              icon: LineIcons.user),
          SizedBox(
            height: 15,
          ),
          WidgetTextField(
              controller: controller.titleFormation,
              context: context,
              hintText: "Ex. Ben Foulen",
              label: "Prénom",
              icon: LineIcons.user),
          SizedBox(
            height: 15,
          ),
          WidgetTextField(
              controller: controller.priceFormation,
              context: context,
              hintText: "Ex. 21200300",
              label: "Numéro téléphone",
              icon: LineIcons.phone),
          SizedBox(
            height: 15,
          ),
          WidgetTextField(
              controller: controller.formateurFormation,
              context: context,
              hintText: "Ex. exmp@mail.com",
              label: "Emal",
              icon: LineIcons.user),
          SizedBox(
            height: 15,
          ),
          WidgetTextField(
              controller: controller.dureeFormation,
              context: context,
              hintText: "XXXXX",
              label: "Mot de passe",
              icon: LineIcons.user),
          SizedBox(
            height: 15,
          ),
          WidgetTextField(
              controller: controller.categoryFormation,
              context: context,
              hintText: "Ex. exmp@mail.com",
              label: "Emal",
              icon: LineIcons.user),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
