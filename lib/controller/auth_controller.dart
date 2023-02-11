import 'dart:convert';

import 'package:eschoolapp/service/authService.dart';
import 'package:eschoolapp/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

final authService = AuthService();

class AuthController extends GetxController {
  TextEditingController cin = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();

  var error = ''.obs;
  var token = ''.obs;
  
  final AuthService _api = AuthService(); 

   Future<void> login() async {
    final response = await _api.post('login', {
      'cin': cin.text,
      'password': password.text,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data); 
      Get.to(HomeScreeen(token: data['data']['token'], role : data['data']['role'] )) ; 
    } else {
      Get.snackbar('Erreur', 'Informations invalide'); 
    }
  }
  

  Future<void> register() async {
    final response = await _api.post('register', {
      'cin': cin.text,
      'password': password.text,
      'role': role.text, 
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      Get.to(HomeScreeen(token: data['data']['token'], role : data['data']['role'] )) ; 
    } else {
      Get.snackbar('Erreur', 'Informations invalide'); 
    }
  }
}
