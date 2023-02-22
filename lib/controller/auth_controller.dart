import 'dart:convert';

import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class AuthController extends GetxController {
  TextEditingController cin = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();

  var error = ''.obs;
  var token = ''.obs;

  // hedhi amalna biha instance lel api men class API fel dossier service
  final API _api = API();

  Future<void> login() async {
    final response = await _api.post('login', {
      'cin': cin.text,
      'password': password.text,
    });
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
     // net3ada lel home screen w m3aya token :p
     // token houwa passport mte3K fel serveur
     // ay action te3mlha serveur yaaml verification lel token
     // raison de securité
     Get.to(HomeScreeen(token: data ['data']['token']));
      Get.snackbar('Success', data['message']);
    } else {
      Get.snackbar('Erreur', data['message']);
    }
  }
}
