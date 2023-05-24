import 'package:eschoolapp/controller/welcome_controller.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/welcome/components/formation_widget.dart';
import 'package:eschoolapp/widgets/deffault_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormationScreen extends StatelessWidget {
  FormationScreen({super.key});
  final WelcomeController controller = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
        builder: (_) => Scaffold(
              appBar: DeffaultAppBar(),
              body: Center(
                  child: SingleChildScrollView(
                      child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: buildFormationCatalogue(context),
              ))),
            ));
  }

   buildFormationCatalogue(BuildContext context) {
    return Wrap(
      children: [
        for (int i = 0; i < controller.title.length; i++)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FormationWidget(
              onPressed: () {
                Get.to(LoginScreen());
              },
              image: controller.image[i],
              title: controller.title[i],
              categorie: controller.categorie[i],
              bgCategorie: Colors.deepOrange,
              formateur: controller.formateur[i].toString(),
              prix: ' ${controller.prix[i]} DT',
              dure: controller.duree[i],
            ),
          )
      ],
    );
  }
}
