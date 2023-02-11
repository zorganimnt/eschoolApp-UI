import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
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
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Login Here"),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: controller.cin,
                            decoration: const InputDecoration(
                                hintText: 'CIN',
                                prefixIcon: Icon(Icons.person)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.password,
                            decoration: const InputDecoration(
                                hintText: 'Mot de passe',
                                prefixIcon: Icon(Icons.lock_rounded)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              onPressed: () {
                                controller.login(); 
                            }, child: const Text("Connexion")),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to( RegisterScreen());
                              },
                              child: const Text(
                                "Créer Compte",
                                style: TextStyle(color: Colors.redAccent),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
