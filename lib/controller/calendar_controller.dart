import 'package:get/get_state_manager/get_state_manager.dart';

class CalendarController extends GetxController {
  var selectedIndex = 0;

  bool isSelectedDate(index) {
    return selectedIndex == index;
  }

  void selectDate(index) {
    selectedIndex = index;

    update();
  }
}
