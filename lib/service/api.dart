import 'dart:async';
import 'dart:convert';
import 'package:eschoolapp/service/check_conx_internet.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class API {
  static String _baseUrl = 'http://127.0.0.1:8000/api';
  static var _client = http.Client();

  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final response = await _client.post(
      Uri.parse('$_baseUrl/$endpoint'),
      body: body,
    );
    print(body);
    return response;
  }

  // tekhou cin comme parametre 
  static Future<dynamic> getStudentByCinAPI(cin) async {
    // hedhi zedt"ha men andi ki yabda projet fel internet
    // kifech tnajem l app taarf est-ce que user
    // connecter bel intenert ou non
    // mawjouda fel fichier li taht api.dart
    if (await checkConnectionInternet()) {
      // hadherna l url
      // ps li houwa b method get donc lazemni n3adi parametre fel url mouch fel body
      // '?' ba3dha parapmetre cin=kedhe thb tzid parametre ekher thot &
      String theUrl = '$_baseUrl/getStudentByCIN?cin=$cin';
      try {
        // o5tna response bch tjiblna l data depend lel url li da5eltou
        final response = await _client
            .get(Uri.parse(theUrl))
            .timeout(const Duration(seconds: 10));
        // timeout just ken saret mochkla direct y5arejna b exception li hiya fet wa9t
        // mta3 request w ykantrek men serveur
        // ken cv yrj3lna response.body li fiha data men db
        return json.decode(response.body);
      } on TimeoutException catch (_) {
        // hedhi exception 3al timeout
        Get.snackbar("Error", "Time Out");
        return null;
      }
    } else {
      // o hedhi else 3al if mta3 hors connxion li aamltha fi louwl
      Get.snackbar("Error", "Internet disconnected");
      return null;
    }
  }

// hedhi mouch taw
  static Future<dynamic> getParentInfo(cin) async {
    // String token = await getValue('token');
    if (await checkConnectionInternet()) {
      String theUrl = '$_baseUrl/getParentByCIN?cin=$cin';
      try {
        final response = await _client
            .get(Uri.parse(theUrl))
            .timeout(const Duration(seconds: 10));
        return json.decode(response.body);
      } on TimeoutException catch (_) {
        Get.snackbar("Error", "Time Out");
        return null;
      }
    } else {
      Get.snackbar("Error", "Internet disconnected");
      return null;
    }
  }
}
