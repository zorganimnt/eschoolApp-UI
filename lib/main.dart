import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/auth/switcher_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // init controller
  AuthController authController = Get.put(AuthController());
  RegisterController regsiterController = Get.put(RegisterController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoSansTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: SwitcherScreen(),
    );
  }
}
