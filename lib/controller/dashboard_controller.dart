import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class DashboardController extends GetxController {
  RxBool homeSelected = RxBool(true);
  RxBool menu2 = RxBool(false);
  RxBool menu3 = RxBool(false);
  RxBool menu4 = RxBool(false);
  RxBool menu5 = RxBool(false);
  RxBool menu6 = RxBool(false);
  int selectedIndex = 0;
  void onChangeItem(index) {
    selectedIndex = index;

    update();
  }

  bool isSelected(index) {
    return index == selectedIndex;
  }

  int selectedUser = -1;
  bool apprenantSelected = false;
  bool parentSelected = false;
  bool formateurSelected = false;
  bool employerSelected = false;
  void changeUserFiltre(index) {
    switch (index) {
      case 0:
        apprenantSelected = !apprenantSelected;
        break;
      case 1:
        parentSelected = !parentSelected;
        break;
      case 3:
        formateurSelected = !formateurSelected;
        break;
      case 2:
        employerSelected = !employerSelected;
        break;
      default:
    }
    update();
  }

  bool isSelectedUser(index) {
    return index == selectedUser;
  }

  void changeSelect(menu) {
    switch (menu) {
      case 1:
        homeSelected.value = true;
        menu2.value = false;
        menu3.value = false;
        menu4.value = false;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 2:
        homeSelected.value = false;
        menu2.value = true;
        menu3.value = false;
        menu4.value = false;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 3:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = true;
        menu4.value = false;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 4:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = false;
        menu4.value = true;
        menu5.value = false;
        menu6.value = false;
        update();
        break;
      case 5:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = false;
        menu4.value = false;
        menu5.value = true;
        menu6.value = false;
        update();
        break;

      case 6:
        homeSelected.value = false;
        menu2.value = false;
        menu3.value = false;
        menu4.value = false;
        menu5.value = false;
        menu6.value = true;
        update();
        break;
      default:
    }
  }
}
