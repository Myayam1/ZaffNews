import 'package:get/get.dart';
import 'package:zaffnews/controllers/database_controller.dart';
import '../controllers/navigation_controller.dart';
import '../controllers/tab_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<TabControllerX>(TabControllerX()); // Change to Get.put()
    Get.put<NavigationController>(NavigationController()); // Change to Get.put()
    Get.put<DatabaseController>(DatabaseController()); // Change to Get.put()
  }
}