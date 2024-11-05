import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zaffnews/pages/mobile_layout/home_tabs/for_you.dart';
import 'package:zaffnews/pages/mobile_layout/home_tabs/newest.dart';
import '../../../widgets/mobile_layout/mobile_appbar.dart';

class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: MobileAppbar(title: 'Home', hasTabs: true), // Use your custom AppBar widget
        body: TabBarView(
          children: [
            MobileNewestView(), // First tab view
            MobileForYouView(), // Second tab view
          ],
        ),
      ),
    );
  }
}