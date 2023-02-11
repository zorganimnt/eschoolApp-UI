import 'dart:convert';
import 'dart:ffi';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService {
  final String _baseUrl = 'http://127.0.0.1:8000/api';
  final _client = http.Client();

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: body,
    );
    print(body); 
    return response;
  }

  Future<void> login(String cin, String password) async {
    final response = await post('login', {
      'cin': cin,
      'password': password,
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data']['token']; 
    } else {
      return null; 
    }
  }

  Future<void> register(String cin, String password, String role) async {
    final response = await post('register', {
      'cin': cin,
      'password': password,
      'role': role, 
    });

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
       return data['data']['token'];  
    } else {
     
    }
  }
}
