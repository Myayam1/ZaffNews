import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zaffnews/controllers/responsive_controller.dart';
import 'package:zaffnews/pages/mobile_layout/bottom_nav_container.dart';
import 'package:zaffnews/pages/tablet_layout/navigation_rail_container.dart';

class ResponsiveManager extends StatelessWidget {
  ResponsiveManager({super.key});
  final ResponsiveController controller = Get.put(ResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isMobile()) {
        return MobileContainerPage();
      } else if (controller.isTablet()) {
        return TabletContainerPage();
      } else {
        throw Exception("inappropriate screen width. what are you doing? either way, get out.");
      }
    });
  }
}
