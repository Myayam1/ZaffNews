import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zaffnews/pages/mobile_layout/bottom_nav_pages/account.dart';
import 'package:zaffnews/pages/mobile_layout/bottom_nav_pages/home.dart';
import 'package:zaffnews/pages/mobile_layout/bottom_nav_pages/trending.dart';

import '../../controllers/navigation_controller.dart';

class MobileContainerPage extends StatelessWidget {
  const MobileContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // connecting controller dengan UI
    final NavigationController navController =
    Get.find();

    final List<Widget> menus = [MyHomePage(), MyTrendingPage(), MyAccountPage()];

    return Obx(() {
      return Scaffold(
        body: menus[navController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: navController.selectedIndex.value,
            onTap: navController.changeMenu,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.language), label: "Trending"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "My Account"),
            ]),
      );
    });
  }
}