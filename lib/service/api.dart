import 'dart:async';
import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:eschoolapp/config/config.dart';
import 'package:eschoolapp/routes/app_routes.dart';
import 'package:eschoolapp/utils/check_conx_internet.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:eschoolapp/utils/storage.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:line_icons/line_icons.dart';

class API {
  static var client = Dio();
  static String url = AddressConfig.apiBaseUrl;

  // *** USER API *** //

  // CRÉER UN UTILISATEUR
  static Future<dynamic> registerUserService(var data) async {
    String theUrl = '$url/register-user';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // CRÉER UN COMPTE DEPEND LE ROLE
  static Future<dynamic> registerUserByRole(var data) async {
    String theUrl = '$url/register';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // OUVRIR UNE SESSION
  static Future<dynamic> loginService(var data) async {
    String theUrl = '$url/login';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // RECÉPURER UN/DES UTILISATEURS
  static Future<dynamic> getUserService(var data) async {
    String theUrl = '$url/get-user';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // RÉCÉPURER UN/DES UTILISATEUR DEPEND ROLE (ADMIN, EMPLOYER, FORMATEUR, PARENT, APPRENANT)
  static Future<dynamic> getUserByRole(var data) async {
    String theUrl = '$url/get-user-by-role';
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // AJOUTER UN EMPLOYER
  static Future<dynamic> addEmployerService(var data) async {
    String theUrl = '$url/add-employer';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // SUPPRIMER UN UTILISATEUR
  static Future<dynamic> deleteUserService(var data) async {
    String theUrl = '$url/delete-user';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // MODIFIER UN UTILISATEUR
  static Future<dynamic> modifyUserService(var data) async {
    String theUrl = '$url/update-profile';
    print(data); 
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // RECHERCHER ET RÉCÉPURER UN UTILISATEUR DEPEND SEARCH BAR
  static Future<dynamic> searchUserService(var data) async {
    String theUrl = '$url/search-user';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // ******** END USER API ********* //

  // *** Formation API *** //

  // RECUPÉRER UNE/DES FORMATION
  static Future<dynamic> getFormationService(var data) async {
    String theUrl = '$url/get-formation';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // MODIFIER UNE FORMATION
  static Future<dynamic> modifyFormationService(var data) async {
    String theUrl = '$url/modify-formation';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // SUPPRIMER UNE FORMATION
  static Future<dynamic> deleteFormationService(var data) async {
    String theUrl = '$url/delete-formation';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // AJOUTER UNE FORMATION
  static Future<dynamic> addFormationService(var data) async {
    String theUrl = '$url/add-formation';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

    // AJOUTER UNE FORMATION
  // static Future<dynamic> getInscriService(var data) async {
  //   String theUrl = '$url/add-formation';
  //   print(theUrl);
  //   try {
  //     Response response =
  //         await client.post(theUrl, data: convert.jsonEncode(data));
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //     showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
  //   }
  // }
// RECHERCHER UNE FORMATION
 static Future<dynamic> searchFormationService(var data) async {
    String theUrl = '$url/search-formation';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }
  // ******** END FORMATION API ********* //


  // ************ Cours API ************ //
 // RECUPÉRER UNE/DES FORMATION
  static Future<dynamic> getCoursService(var data) async {
    String theUrl = '$url/get-cours';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }
 // MODIFIER UNE FORMATION
  static Future<dynamic> modifyCoursService(var data) async {
    String theUrl = '$url/modify-cours';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }
   // SUPPRIMER UNE FORMATION
  static Future<dynamic> deleteCoursService(var data) async {
    String theUrl = '$url/delete-cours';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }
    // AJOUTER UNE FORMATION
  static Future<dynamic> addCoursService(var data) async {
    String theUrl = '$url/add-cours';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // getcoursByformationid

  static Future<dynamic> getcoursByformationidService(var data) async {
    String theUrl = '$url/getcoursByformationid';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  // getformationByformateur

  static Future<dynamic> getformationByformateurIdService(var data) async {
    String theUrl = '$url/getformationByformateur';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }
 // ******** END Cours API ************ //


   static Future<dynamic> sendMsgService(var data) async {
    String theUrl = '$url/send-message';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  static Future<dynamic> searchByNameService(var data) async {
    String theUrl = '$url/search-user-by-name';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

    static Future<dynamic> getChatService(var data) async {
    String theUrl = '$url/get-chat';
    print(theUrl);
    try {
      Response response =
          await client.post(theUrl, data: convert.jsonEncode(data));
      return response.data;
    } catch (e) {
      print(e.toString());
      showError("Erreur", "Erreur est servenue", LineIcons.exclamationCircle);
    }
  }

  


}
