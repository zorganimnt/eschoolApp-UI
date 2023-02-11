import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (_) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Register Here"),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: controller.role,
                            decoration: InputDecoration(
                                hintText: 'role',
                                prefixIcon: Icon(Icons.person_rounded)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.cin,
                            decoration: InputDecoration(
                                hintText: 'cin',
                                prefixIcon: Icon(Icons.password)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller: controller.password,
                            decoration: InputDecoration(
                                hintText: 'Mot de passe',
                                prefixIcon: Icon(Icons.lock)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(onPressed: () {
                            controller.register(); 
                          }, child: Text("Créer")),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {
                                Get.to(LoginScreen());
                              },
                              child: Text(
                                "Connexion",
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
