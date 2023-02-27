import 'package:eschoolapp/controller/student_controller.dart';
import 'package:eschoolapp/utils/color.dart';
import 'package:eschoolapp/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key});

  StudentController studentController = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Ajouter un étudiant",
          style: TextStyle(color: Colors.black87, fontSize: 15),
        ),
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              buildSearchStudent(),
              const SizedBox(
                height: 10,
              ),
              // OBX widget bech taamlna distrucbtion 3ali sayer
              // fel student controller w traj3lna
              // puisque ahna 7atina .obs
              // .obs nesta3ml m3aha obx fel UI bech naarf chnouwa raja3 exactly
              Obx(() => studentController.loading.value
                  // ken mazel ylodi yafichi circle tlodi
                  ? const CircularProgressIndicator()
                  // ken maadch bech ychouf est ce que name rja3 null wale
                  : studentController.studentModel.value.nameStudent == null
                      // ken null mayafichi chy Container fergh
                      ? Container()
                      // sinon yafichilna Widget li fiha name w img w ajouter
                      : StudentCard(
                          img: "assets/icons/pdp.png",
                          studentName: studentController
                              .studentModel.value.nameStudent
                              .toString(),
                        )),
            ],
          ),
        ),
      )),
    );
  }

  Column buildSearchStudent() {
    return Column(
              children: [
                TextFormField(
                  // depend lel textInput hazina l value li nektb fih w lawejna bih fel base aal li etudiant li aandou cin hedhika
                  controller: studentController.cin,
                  decoration: const InputDecoration(hintText: "Recherche..."),
                ),
                TextButton(
                    onPressed: () {
                      // clica aala lawej aficha l student depend lel cin mte3ou
                      studentController.getStudentByCin();
                    },
                    child: Text("lawej"))
              ],
            );
  }
}

class StudentCard extends StatelessWidget {
  final String img;
  final String? studentName;

  const StudentCard({
    Key? key,
    required this.img,
    required this.studentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(img),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(studentName ?? ""),
            ],
          ),
          TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.add_rounded,
                    size: 16,
                  ),
                  const Text("Ajouter"),
                ],
              ))
        ],
      ),
    ));
  }
}
