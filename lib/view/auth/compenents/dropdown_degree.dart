import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> category = <String>[
  'Séléctioner votre niveaux',
  '1er Licence',
  '1er Cycle Prépa',
  '1er Mastere de Recherche',
  '1er Mastere Proffesionnel',
  '1er Cycle Ingénieur',
  '2éme Licence',
  '2éme Cycle Prépa',
  '2éme Mastere de Recherche',
  '2éme Mastere Proffessionel',
  '2éme Cycle Ingénieur',
  '3éme Licence',
  '3éme Cycle Ingénieur'
];

class DropDownDegree extends StatefulWidget {
  DropDownDegree({super.key});
  @override
  State<DropDownDegree> createState() => _DropDownDegreeState();
}

class _DropDownDegreeState extends State<DropDownDegree> {
  String dropdownValue = category.first;
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
          controller.degreeStudent = value;
          print(controller.degreeStudent);
        });
      },
      items: category.map<DropdownMenuItem<String>>((String value) {
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
