import 'dart:convert';

import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/service/save_token.dart';
import 'package:eschoolapp/view/home/main_screen.dart';
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
    var loginData = {
      'cin': cin.text,
      'password': password.text,
    };
    final response = await _api.post('login', loginData);
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      await saveValue("token", data['data']['token']).then((value) {
        Storage.isTokenSaved.value = true;
      });
    } else {
      Get.snackbar('Erreur', data['message']);
    }
  }
}
