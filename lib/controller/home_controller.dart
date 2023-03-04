import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedIndex = 0;
  void onChangeItem(index) {
    selectedIndex = index;
    update();
  }

  bool isSelected(index){
    return index==selectedIndex; 
  }
}