import 'dart:convert';

import 'package:eschoolapp/model/note.dart';
import 'package:eschoolapp/model/student.dart';
import 'package:eschoolapp/service/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController {
    var noteList = List<NoteModel>.empty().obs;

  RxBool loading = false.obs;
  Rx<NoteModel?> noteModel = NoteModel().obs;

  @override
  void onInit() {
    super.onInit();
    getNotes(); 
  }
  

  Future<NoteModel?> getNotes() async {
    loading.value = true;

    dynamic json = await API.getNotes();

    if (json != null) {
      if (json['success']) {
         json['data'].forEach((item) {
          noteList.add(NoteModel.fromJson(item));

        });
        print(noteList[2].matiere); 
        loading.value = false;

      } else {
        loading.value = false;
        Get.snackbar("Error", json['message'] ?? '');
        return null;
      }
    }
    return null;
  }
}
