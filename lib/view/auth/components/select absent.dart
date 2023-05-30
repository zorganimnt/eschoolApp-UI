import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> category = <String>[
  'Sélectionner',
  'Présent',
  'Absent', 
];

class absent extends StatefulWidget {
  absent({super.key});
  @override
  State<absent> createState() => _absent();
}

class _absent extends State<absent> {
  String dropdownValue = category.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: MediaQuery.of(context).size.height/2,
      isExpanded: false,
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