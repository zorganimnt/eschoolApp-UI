import 'dart:convert';
import 'dart:ffi';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class API {
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
}
