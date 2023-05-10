import 'package:eschoolapp/controller/register_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const List<String> speciality = <String>[
  'Séléctioner votre spécialité',
  'Informatique',
  'Marketing',
  'Design', 
  'Montage', 
  'Autre'
];

class DropDownSpeciality extends StatefulWidget {
  DropDownSpeciality({super.key});
  @override
  State<DropDownSpeciality> createState() => _DropDownSpecialityState();
}

class _DropDownSpecialityState extends State<DropDownSpeciality> {
  String dropdownValue = speciality.first;
  RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      menuMaxHeight: MediaQuery.of(context).size.height/2,
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
          controller.speciality.value = value;
        });
      },
      items: speciality.map<DropdownMenuItem<String>>((String value) {
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
