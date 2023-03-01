
import 'package:eschoolapp/controller/student_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/auth/reigster_screen.dart';
import 'package:eschoolapp/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SwitcherScreen extends StatelessWidget {
  SwitcherScreen({super.key});
  StudentController controller = Get.put(StudentController()); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

      
              
              Image.asset(
                "assets/icons/logo-app.png",
                width: 400,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bienvenue,",
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Inscrit au l'application comme étant..",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomButton(
                      radius: 45,
                      height: 50,
                      color: Colors.white,
                      onPressed: (() {
                        Get.to(RegisterScreen(role: "parent"));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/parent-icon.svg",
                            width: 22,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Parent",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 13,
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              size: 12, color: Colors.grey)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: CustomButton(
                      radius: 45,
                      height: 50,
                      color: Colors.white,
                      onPressed: (() {
                        Get.to(RegisterScreen(role: "student"));
                      }),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/student-icon.svg",
                            width: 22,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text("Étudiant",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 13,
                          ),
                          Icon(Icons.arrow_forward_ios_rounded,
                              size: 12, color: Colors.grey)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        children: [
                          Text(
                            "Tu déja inscrit dans l'application? ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          InkWell(
                            onTap: (() {
                              Get.to(LoginScreen()); 
                            }),
                            child: Text(
                              "Connexion.",
                              style: TextStyle(color: primaryColor, 
                             decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                              
                            ),
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
