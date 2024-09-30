import 'package:get/get.dart';

class TabControllerX extends GetxController {
  var selectedIndex = 0.obs; // Observable variable for the selected tab index

  void changeTab(int index) {
    selectedIndex.value = index; // Update the selected tab index
  }
}
