import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  var screenWidth = 0.0.obs;

  void updateScreenWidth(width) {
    screenWidth.value = width;
  }

  bool isMobile() => screenWidth.value < 600;
  bool isTablet() => screenWidth.value >= 600 && screenWidth < 1200;
}