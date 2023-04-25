import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> university= <String>[
  'Séléctionner votre université',
  'Université de Bizert',
  'Université de Tunis',
  'Université de Kef',
  'Université de Sousse',
  'Université de Nabeul',
  'Université de Monastir',
  'Université de Kairouen',
  'Université de Mahdia',
  'Université de Sidi Bouzid',
  'Université de Gafsa',
  'Université de Kasserine',
  'Université de Jandouba',
  'Université de Béja',
  'Université de Mednine',
  'Université de Tozeur',
 
];

class DropDownUniver extends StatefulWidget {
  DropDownUniver({super.key});
  @override
  State<DropDownUniver> createState() => _DropDownUniverState();
}

class _DropDownUniverState extends State<DropDownUniver> {
  String dropdownValue = university.first;
  RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: dropdownValue,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      elevation: 16,
      style: TextStyle(color: Colors.black87),
      underline: Container(
        height: 1,
        color: primaryColor,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          controller.univerStudent = value;
          //print(controller.specialityStudent);
        });
      },
      items: university.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        );
      }).toList(),
    );
  }
}
