import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabNoteController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    const Tab(child: Text('DS')),
    const Tab(child: Text('Examen')),
    const Tab(child: Text('Orale')),
    const Tab(child: Text('TP')),

    // kol wahda fi tableau just tawa bech njouti fi kol tab l notet w esm matiere
  ];

  late TabController tbcontroller;
  

  // hedhouma khbebl chaandk fihom :D
  @override
  void onInit() {
    super.onInit();
    tbcontroller = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void onClose() {
    tbcontroller.dispose();
    super.onClose();
  }
}
