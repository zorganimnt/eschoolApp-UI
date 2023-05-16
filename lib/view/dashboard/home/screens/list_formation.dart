import 'package:eschoolapp/controller/dashboard_controller.dart';
import 'package:eschoolapp/controller/formation_controller.dart';
import 'package:eschoolapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ListFormation extends StatelessWidget {
  ListFormation({super.key});

  final FormationController controller = Get.put(FormationController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormationController>(
        builder: (_) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0.2,
                            color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.circular(15)),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Liste des formations",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 350,
                                child: WidgetTextField(
                                  onChanged: (value) {
                                   value==""? controller.getFormation('all') :  controller.searchFormation(value); 
                                  },
                                 
                                    context: context,
                                    label: "Recherche",
                                    hintText: "Rechercher une formation",
                                    icon: LineIcons.search),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DataTable(
                            columns: controller.columns,
                            rows: controller.rows,
                          ),

                          /*  Container(
                                        color: Colors.white,
                                        width: double.infinity,
                                        height: 50,
                                        child: Row(
                                    
                                            children:  [
                                              Text(controller.id[index].toString()),
                                              Text(controller.title[index]),
                                              SizedBox(width: 30,), 
                                              Text(controller.formateur[index].toString()),
                                           SizedBox(width: 30,), 
                                              Text(controller.duree[index]),
                                              Text('${controller.price[index]}DT'),
                                              Text("modifier"),
                                            ]),
                                      ); */
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }
}
