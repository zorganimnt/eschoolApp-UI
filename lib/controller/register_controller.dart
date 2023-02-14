import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

enum SingingCharacter { customer, supplier }

class RegisterController extends GetxController {
  //SingingCharacter? type = SingingCharacter.customer;

  // ==== declare variable ==== /
  // auth register for indicate role
  TextEditingController? roleUser = TextEditingController();
  TextEditingController? cinUser = TextEditingController();
  TextEditingController? passUser = TextEditingController();
  // student register
  
  TextEditingController? fullNameStudent = TextEditingController();
  TextEditingController? emailStudent = TextEditingController();
  TextEditingController? phoneStudent = TextEditingController();
  String? degreeStudent;
  String? specialityStudent;

  // send data student

  // parent register
  TextEditingController? fullNameParent = TextEditingController();
  TextEditingController? emailParent = TextEditingController();
  TextEditingController? phoneParent = TextEditingController();
}
