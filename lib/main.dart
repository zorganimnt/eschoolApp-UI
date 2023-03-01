import 'package:eschoolapp/controller/auth_controller.dart';
import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/view/Parent/add_student_screen.dart';
import 'package:eschoolapp/view/auth/login_screen.dart';
import 'package:eschoolapp/view/auth/switcher_screen.dart';
import 'package:eschoolapp/view/home/home_screen.dart';
import 'package:eschoolapp/view/note/list_note.dart';
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
      //home: HomeScreeen(), 
      //home : SwitcherScreen(),
      // li hachtk biha nehi l comment o zid l commnt aa lebkiya
      home: ListNoteScreen(),
       // hedhi badelha dima bel page li testi fiha bech tsahel aala rouhk direct ki debegu tbenlk
    );
  }
}
