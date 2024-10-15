import 'package:get/get.dart';
import 'package:zaffnews/controllers/database_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/tab_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<TabControllerX>(TabControllerX()); // Change to Get.put()
    Get.put<DashboardController>(DashboardController()); // Change to Get.put()
    Get.put<DatabaseController>(DatabaseController()); // Change to Get.put()
  }
}