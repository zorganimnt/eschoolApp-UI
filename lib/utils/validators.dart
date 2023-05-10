import 'package:get/get.dart';

class Validators {
  Validators._();

  static String? validateNotNullOrEmpty(final String? value) {
    if (value == null || value.isEmpty) return 'Ce champ est obligatoire';
    return null;
  }

  static bool isName(final String str) {
    const char = "ABCDEFGHIJKLMNOPQRSTUVWXYZ ";

    for (int i = 0; i < str.length; i++) {
      if (!char.contains(str[i].toUpperCase())) {
        return false;
      }
    }
    return true;
  }

  static String? validateName(final String? name) {
    if (name == '') return 'Ce champ est obligatoire';
    if (!isName(name!)) {
      return 'Cet nom est invalide';
    }
    if (name.length > 2) {
      return null;
    } else {
      return 'Ce champ doit contenir au moins 3 caractères';
    }
  }

  static String? validateLastName(final String? name) {
    if (name == '') return 'Ce champ est obligatoire';
    if (!isName(name!)) {
      return 'Cet prénom est invalide';
    }
    if (name.length > 2) {
      return null;
    } else {
      return 'Ce champ doit contenir au moins 3 caractères';
    }
  }

  static String? validatePassword(final String? password) {
    if (password == null) return 'Ce champ est obligatoire';
    if (password.length > 5) {
      return null;
    } else {
      return 'Mot de passse doit contenir au moins 6 caractères';
    }
  }

  static String? validateEmail(final String? email) {
    if (email == null) return 'Ce champ est obligatoire.';

    if (GetUtils.isEmail(email)) {
      return null;
    } else {
      return 'Cet email est invalide.';
    }
  }

  static String? validateCodeTexto(final String? texto) {
    if (texto == null) return 'Ce champ est obligatoire.';
    if ((texto.length == 6) && (GetUtils.isNum(texto))) {
      return null;
    } else {
      return 'Ce code OTP est invalide.';
    }
  }

  static String? validatePhoneNumber(final String? phone) {
    if (phone == null) return 'Ce champ est obligatoire.';

    if (phone.length == 8 && GetUtils.isNumericOnly(phone)) {
      return null;
    } else {
      return 'Ce numéro de télépone est invalide.';
    }
  }
}
