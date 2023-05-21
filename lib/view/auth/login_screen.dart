import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/widgets/custom_button.dart';
import 'package:eschoolapp/widgets/custom_input_field.dart';
import 'package:eschoolapp/widgets/deffault_app_bar.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:DeffaultAppBar(),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: ResponsiveWrapper.of(context).isSmallerThan("DESKTOP")
                  ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                  : const EdgeInsets.symmetric(horizontal: 300, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    WidgetTextField(
                        controller: controller.email,
                        context: context,
                        label: "Adresse e-mail",
                        hintText: "foulen@eschoolapp.tn",
                        icon: LineIcons.envelope),
                    SizedBox(
                      height: 20,
                    ),
                    WidgetTextField(
                        controller: controller.password,
                        context: context,
                        hintText: "xxxxxx",
                        label: "Mot de passe",
                        isPassword: true,
                        icon: LineIcons.key),
                    SizedBox(
                      height: 20,
                    ),
                   SizedBox(
                     width: double.infinity,
                     child: CustomTextButton(
                         onPressed: () {
                           controller.handleLogin();
                         },
                         child: Obx(
                           () => controller.isLoading.value
                               ? CircularProgressIndicator(
                                   color: Colors.white,
                                 )
                               : Text(
                                   "Connexion",
                                   style: TextStyle(
                                       fontSize: 15, color: Colors.white),
                                 ),
                         )),
                   ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Form _buildFormLogin(context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CustomTextFormField(
              controller: controller.email,
              hintText: "Adresse e-mail",
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
                    // controller.login();
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
