import 'dart:js_util';

import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/utils/validators.dart';
import 'package:eschoolapp/view/auth/components/drop_down_role.dart';
import 'package:eschoolapp/view/auth/components/pick_image.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/auth/next_step_register.dart';

import 'package:eschoolapp/widgets/deffault_app_bar.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final RegisterController controller = Get.put(RegisterController());
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DeffaultAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.8,
                    height: 500,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage('assets/icons/user-registration.png'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Form(
                      key: registerFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Créer votre compte Eschoolapp gratuitement",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Divider(
                              height: 1.5,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 150, child: PickPhoto()),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Divider(
                              height: 1.5,
                            ),
                          ),
                          WidgetTextField(
                              validator: Validators.validateName,
                              controller: controller.nameUser,
                              context: context,
                              hintText: "Ex. Foulen",
                              label: "Nom",
                              icon: LineIcons.user),
                          SizedBox(
                            height: 15,
                          ),
                          WidgetTextField(
                              
                              validator: Validators.validateLastName , 
                              controller: controller.lastNameUser,
                              context: context,
                              hintText: "Ex. Ben Foulen",
                              label: "Prénom",
                              icon: LineIcons.user),
                          SizedBox(
                            height: 15,
                          ),
                          WidgetTextField(
                              validator: Validators.validatePhoneNumber,
                              controller: controller.phoneUser,
                              context: context,
                              hintText: "Ex. 20100200",
                              label: "Numéro de téléphone",
                              icon: LineIcons.phone),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 1.5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          WidgetTextField(
                              validator: Validators.validateEmail,
                              controller: controller.emailUser,
                              context: context,
                              hintText: "Ex. exemple@email.com",
                              label: "Adresse E-mail",
                              icon: LineIcons.envelope),
                          SizedBox(
                            height: 15,
                          ),
                          WidgetTextField(
                            validator: Validators.validatePassword,
                              controller: controller.passwordUser,
                              context: context,
                              hintText: "XXXXX",
                              label: "Mot de passe",
                              isPassword: true,
                              icon: LineIcons.lock),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            height: 1.5,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Je suis : ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              RoleDropDown(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: double.infinity,
                            //margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTextButton(
                                onPressed: () {
                                  if (registerFormKey.currentState!
                                      .validate()) {
                                    controller.reigsterUser();
                                  } else {
                                    Get.snackbar("Erreur de saisie",
                                        "Merci de verifier votre numéro de téléphone.");
                                  }
                                },
                                child: Obx(
                                  () => controller.isLoading.value
                                      ? CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : Text(
                                          "Créer un compte",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
