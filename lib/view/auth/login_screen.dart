import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/widgets/custom_button.dart';
import 'package:eschoolapp/widgets/custom_input_field.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

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
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/icons/login1.png', width: 230,), 
                    WidgetTextField(
                        context: context,
                        label: "Adresse e-mail",
                        hintText: "foulen@eschoolapp.tn",
                        icon: LineIcons.envelope),
                    SizedBox(
                      height: 20,
                    ),
                    WidgetTextField(
                        context: context,
                        hintText: "xxxxxx",
                        label: "Mot de passe",
                        isPassword: true,
                        icon: LineIcons.key),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextButton(
                        onPressed: () {
                         Get.toNamed(AppRoutes.home);
                        },
                        child: const Text(
                          "Connexion",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Expanded(child: Divider()),
                        SizedBox(
                          width: 10,
                        ),
                        const Center(child: Text("ou")),
                        SizedBox(
                          width: 10,
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 20,), 
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomTextButton(
                        background: Colors.redAccent,
                        onPressed: () {
                          //  loginController.isLoading.value = true;
                          //  loginController.login();
                        },
                        child: const Text(
                          "Inscription",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
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
              hintText: "Nom d'utilisateur",
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
