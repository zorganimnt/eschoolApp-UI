import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/widgets/custom_button.dart';
import 'package:eschoolapp/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // return get build khater sta3mlt GetX
    // w staghnit aal statefullwidget jemla
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: primaryColor),
            ),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/login-logo.png",
                    width: 250,
                  ),
                  _buildFormLogin(context),
                ],
              ),
            ),
          );
        });
  }

  Form _buildFormLogin(context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: controller.cin,
              hintText: 'Numéro de CIN',
              prefixIcon: Icon(Icons.numbers_rounded),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              controller: controller.password,
              hintText: 'Mot de passe',
              prefixIcon: Icon(Icons.lock_rounded),
              isPassword: true,
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                  radius: 45,
                  height: 52,
                  color: primaryColor,
                  onPressed: () {
                    controller.login();
                  },
                  child: Text(
                    "Connexion",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  )),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
                onTap: (() {}),
                child: Text(
                  "J'oublie le mot de passe.",
                  style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: Colors.deepPurple),
                ))
          ],
        ),
      ),
    );
  }
}
