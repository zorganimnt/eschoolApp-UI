import 'package:eschoolapp/controller/calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalendarScreen extends StatelessWidget {
  CalendarScreen({
    super.key,
  });
  CalendarController controller = Get.put(CalendarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendarController>(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 15,10,0),
              child: _buildDateWidget(context),
            ),
            SizedBox(
              height: 20,
            ),
            LessonWidget(
              color: Colors.teal,
              title: "Rattrapage",
              lesson: "Informatique - Algorithme",
              time: "09:00-10:00AM"
            ),
             LessonWidget(
              color: Colors.red,
              title: "Séance 2",
              lesson: "Mathématique - Statestique",
              time: "12:00-02:00PM"
            ),
             LessonWidget(
              color: Colors.blue,
              title: "Séance 4",
              lesson: "Option - Français",
              time: "09:00-10:00AM"
            )
          ],
        ),
      );
    });
  }

  SizedBox _buildDateWidget(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (() {
                      controller.selectDate(index);
                    }),
                    child: Container(
                      width: 70,
                      height: 90,
                      decoration: BoxDecoration(
                          color: controller.isSelectedDate(index)
                              ? Colors.blue.shade800
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "TUE",
                            style: TextStyle(
                              fontSize: 11,
                              color: controller.isSelectedDate(index)
                                  ? Colors.white54
                                  : Colors.grey,
                            ),
                          ),
                          Text(
                            (index + 10).toString(),
                            style: TextStyle(
                                color: controller.isSelectedDate(index)
                                    ? Colors.white
                                    : Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

class LessonWidget extends StatelessWidget {
  final Color? color;
  final String title;
  final String lesson;
  final String time;
  const LessonWidget({
    Key? key,
    this.color,
    required this.title,
    required this.lesson,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12,8,12,8),
      child: Container(
       
        height: 120,
        color: color!.withOpacity(0.12),
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 5,
                  color: color,
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black26,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  lesson,
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  time,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
