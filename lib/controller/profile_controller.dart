import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ProfileController extends GetxController {

  RxBool isHover = RxBool(false); 
  void showCamera(value) {
    isHover.value=value; 
    update(); 
  }
}