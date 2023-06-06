import 'package:eschoolapp/service/api.dart';
import 'package:eschoolapp/utils/notifications.dart';
import 'package:eschoolapp/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ChatController extends GetxController {
  TextEditingController msgContent = TextEditingController();
  RxInt receiverId = RxInt(0);
  RxBool isLoading = RxBool(false);
  void chnangeReceiverId(id) {
    receiverId.value = id;
    update();
  }

  void sendMessage() async {
    int senderId = await getValue('id');
    var data = {
      "sender_id": senderId,
      "receiver_id": receiverId.value,
      "msg_content": msgContent.text,
    };
    print(data);
    dynamic json = await API.sendMsgService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        showSuccess(
            "Success", "Cours ajouté avec succées", LineIcons.checkCircle);
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
    isLoading.value = false;
    return null;
  }

  TextEditingController searchName = TextEditingController();

  List<int> id = [];
  List<String> nom = [];
  List<String> prenom = [];
  List<String> urlPhoto = [];

  searchUser() async {
    isLoading.value = true;
    id.clear();
    nom.clear();
    prenom.clear();
    var data = {
      "name": searchName.text,
    };
    dynamic json = await API.searchByNameService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        print(data);
        for (var element in data) {
          id.add(element['id']);
          nom.add(element['name']);
          prenom.add(element['lastName']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
  }

  List<String> msg = [];

  getConver() async {
    int senderId = await getValue('id');
    isLoading.value = true;
    msg.clear();
    var data = {
      "sender_id": 4,
      "receiver_id": 27,
    };
    dynamic json = await API.getChatService(data);
    isLoading.value = false;
    if (json != null) {
      if (json['success']) {
        List<dynamic> data = json['data'];
        print(data);
        for (var element in data) {
          msg.add(element['msg_content']);
        }
        update();
      } else {
        showError("Error", json['message'], LineIcons.exclamationTriangle);
      }
    }
  }

  clearList() {
    id.clear();
    nom.clear();
    prenom.clear();
    update();
  }
}
