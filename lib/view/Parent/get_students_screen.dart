import 'package:eschoolapp/controller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListChildrenScreen extends StatelessWidget {
   ListChildrenScreen({super.key});
  StudentController controller = Get.put(StudentController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (() {
          controller.getChildren();
        })),
        appBar: AppBar(
          title: Text("Liste des enfants"),
        ),
        body: Obx(() => controller.loading.value
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                        itemCount: controller.childrenList.length,
                        itemBuilder: (context, index) {
              return ChildCard(
                name: controller.childrenList[index].nameStudent?? 'null'
              );
                        })));
  }
}

class ChildCard extends StatelessWidget {
  final String name;
  const ChildCard({
    Key? key,
     required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Card(
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icons/pdp.png"),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(name),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete_rounded,
                    color: Colors.black54,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
