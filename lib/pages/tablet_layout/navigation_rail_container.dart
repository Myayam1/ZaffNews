import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/controllers/navigation_controller.dart';

import '../mobile_layout/bottom_nav_pages/account.dart';
import '../mobile_layout/bottom_nav_pages/home.dart';
import '../mobile_layout/bottom_nav_pages/trending.dart';

class TabletContainerPage extends StatelessWidget {
  const TabletContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();
    final List<Widget> menus = [MyHomePage(), MyTrendingPage(), MyAccountPage()];

    return Scaffold(
      body: Row(
        children: [
          Obx(() => NavigationRail(
            selectedIndex: navController.selectedIndex.value,
            onDestinationSelected: (int index) {
              navController.changeMenu(index);
            },
            destinations: [
              NavigationRailDestination(
                  icon: Icon(Icons.home_outlined), label: Text("Home")),
              NavigationRailDestination(
                  icon: Icon(Icons.language), label: Text("Trending")),
              NavigationRailDestination(
                  icon: Icon(Icons.account_circle), label: Text("My Account")),
            ],
            backgroundColor: backgroundColor,
            labelType: NavigationRailLabelType.selected,
            groupAlignment: 0.0,
          )),
          Expanded(
              child: Obx(() {
                return menus[navController.selectedIndex.value];
              })
          )
        ],
      ),
    );
  }
}
