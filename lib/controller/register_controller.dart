import 'dart:convert';

import 'package:eschoolapp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

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
  String? univerStudent;

  // send data student

  // parent register
  TextEditingController? fullNameParent = TextEditingController();
  TextEditingController? emailParent = TextEditingController();
  TextEditingController? phoneParent = TextEditingController();

  var error = ''.obs;
  var token = ''.obs;
  final API _api = API();

  // hedhi mta3 parent register
  Future<void> parentRegister() async {
    // postina l request fi raj3et response fi response
    final response = await _api.post('register', {
      "cin": cinUser!.text,
      "role": "parent",
      "name": fullNameParent!.text,
      "phone": phoneParent!.text,
      "mail": emailParent!.text,
      "password": passUser!.text,
    });

    // baed decodit body mta3 response puisque li hiya JSON
    var msg = json.decode(response.body);

    // o nchouf resultat mte3 response ken 200 raw OK t3adet sans faute
    if (response.statusCode == 200) {
      // ken 200 cv nwalou naamlou variable nhotou fih data ken hachti bihom
      //final data = json.decode(response.body);
      Get.snackbar('Success', msg['message']);
    } else {
      // sinn t5arej erreur sous forme snackbar
      // hiya zeda widget o najmou nbadlou fiha
      Get.snackbar('Erreur', msg['message']);
    }
  }

  //kif kif hedhi
  Future<void> studentRegister() async {
    final response = await _api.post('register', {
      "cin": cinUser!.text,
      "role": "student",
      "name": fullNameStudent!.text,
      "phone": phoneStudent!.text,
      "mail": emailStudent!.text,
      "password": passUser!.text,
      "university": univerStudent!,
      "speciality": specialityStudent!,
      "degree": degreeStudent!
    });
    var msg = json.decode(response.body);
    if (response.statusCode == 200) {
      //final data = json.decode(response.body);
      Get.snackbar('Success', msg['message']);
    } else {
      Get.snackbar('Erreur', msg['message']);
    }
  }
}
