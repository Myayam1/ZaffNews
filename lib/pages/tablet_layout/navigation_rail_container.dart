import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/controllers/navigation_controller.dart';
import 'package:zaffnews/pages/tablet_layout/nav_rail_pages/trending.dart';
import 'package:zaffnews/widgets/mobile_layout/mobile_appbar.dart';
import 'package:zaffnews/widgets/tablet_layout/tablet_appbar.dart';

import '../../widgets/my_icon_button.dart';
import '../mobile_layout/bottom_nav_pages/account.dart';
import 'nav_rail_pages/home.dart';

class TabletContainerPage extends StatelessWidget {
  const TabletContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();
    final List<Widget> menus = [TabletHomePage(), TabletTrendingPage(), MobileAccountPage()];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Row(
        children: [
          Obx(() => Container(
            width: 80.0,
            child: NavigationRail(
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
              selectedIndex: navController.selectedIndex.value,
              backgroundColor: backgroundColor,
              groupAlignment: 0.0,
              labelType: NavigationRailLabelType.selected,
              leading: navController.selectedIndex.value == 2 ? null
                       : Container(
                         padding: EdgeInsets.only(top: 16.0),
                         child: MyIconButton(
                            icon: Icons.search,
                            onPressed: () {
                              Get.toNamed('/search');
                            },
                         ),
                       ),
            ),
          )),
          Expanded(
              child: Obx(() {
                return Container(child: menus[navController.selectedIndex.value]);
              })
          )
        ],
      ),
    );
  }
}
