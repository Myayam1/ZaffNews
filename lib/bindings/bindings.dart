import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/tab_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TabControllerX());
    Get.lazyPut(() => DashboardController());
  }
}