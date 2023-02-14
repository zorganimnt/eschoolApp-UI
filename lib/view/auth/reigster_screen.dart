import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/auth/dropdown_degree.dart';
import 'package:eschoolapp/view/auth/dropdown_speciality.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/widgets/custom_button.dart';
import 'package:eschoolapp/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final String role;
  RegisterScreen({super.key, required this.role});
  AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
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
              child: SingleChildScrollView(
                child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    role == "student"
                        ? _buildFormStudentRegister(context)
                        : _buildFormParentRegister(context),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Form _buildFormParentRegister(context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text("Comme étant parent", 
                        style: TextStyle(
                          fontSize: 22, 
                          color: Colors.black87
                        ),),
                      ],
                    ),
                      Wrap(
                      children: [
                        Text("Tu doit remplir les informations suivants", 
                        style: TextStyle(
                          fontSize: 12, 
                          color: Colors.black54
                        ),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18,),  
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                       CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: Icon(Icons.person_rounded, 
                        size: 19,
                        color: Colors.black54,),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "Information personnel",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Nom et prénom',
                  prefixIcon: Icon(Icons.person_rounded),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Numéro de téléphone',
                  prefixIcon: Icon(Icons.phone_rounded),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Adresse e-mail',
                  prefixIcon: Icon(Icons.email_rounded),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: Icon(Icons.lock_rounded, 
                        size: 19,
                        color: Colors.black54,),
                      ),
                      SizedBox(width: 8,), 
                      Text(
                        "Information d'authentification",
                        style: TextStyle(fontSize: 18, ),
                      ),
                    ],
                  ),
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Numéro de CIN',
               
                  prefixIcon: Icon(Icons.numbers_rounded),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock_rounded),
                  isPassword: true,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: CustomButton(
                radius: 45,
                  height: 52,
                  color: primaryColor,
                  onPressed: () {
                    controller.register();
                  },
                  child: Text(
                   "Confirmer",
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w500,
                       fontSize: 18),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
Form _buildFormStudentRegister(context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text("Comme étant étudiant", 
                        style: TextStyle(
                          fontSize: 22, 
                          color: Colors.black87
                        ),),
                      ],
                    ),
                      Wrap(
                      children: [
                        Text("Tu doit remplir les informations suivants", 
                        style: TextStyle(
                          fontSize: 12, 
                          color: Colors.black54
                        ),),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 18,),  
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                       CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: Icon(Icons.person_rounded, 
                        size: 19,
                        color: Colors.black54,),
                      ),
                      SizedBox(width: 8,),
                      Text(
                        "Information personnel",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Nom et prénom',
                  prefixIcon: Icon(Icons.person_rounded),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Numéro de téléphone',
                  prefixIcon: Icon(Icons.phone_rounded),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Adresse e-mail',
                  prefixIcon: Icon(Icons.email_rounded),
                ),
                 const SizedBox(
                  height: 10,
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DropDownDegree(),
                  SizedBox(height: 10,), 
                  DropDownSpec()
                ],
              ),
            ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: Icon(Icons.lock_rounded, 
                        size: 19,
                        color: Colors.black54,),
                      ),
                      SizedBox(width: 8,), 
                      Text(
                        "Information d'authentification",
                        style: TextStyle(fontSize: 18, ),
                      ),
                    ],
                  ),
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Numéro de CIN',
               
                  prefixIcon: Icon(Icons.numbers_rounded),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: controller.cin,
                  hintText: 'Mot de passe',
                  prefixIcon: Icon(Icons.lock_rounded),
                  isPassword: true,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.1,
              child: CustomButton(
                radius: 45,
                  height: 52,
                  color: primaryColor,
                  onPressed: () {
                    controller.register();
                  },
                  child: Text(
                   "Confirmer",
                   style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.w500,
                       fontSize: 18),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

}
