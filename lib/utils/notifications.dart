import 'package:flutter/material.dart';
import 'package:get/get.dart';

showError(String title, String content, IconData icon) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, content,
        colorText: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: Colors.red.withOpacity(0.8),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ));
  }
}

showSuccess(String title, String content, IconData icon) {
  if (!Get.isSnackbarOpen) {
    Get.snackbar(title, content,
        colorText: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        backgroundColor: Colors.teal.withOpacity(0.8),
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ));
  }
}
