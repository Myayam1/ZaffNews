import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:zaffnews/pages/home_tabs/for_you.dart';
import 'package:zaffnews/pages/home_tabs/newest.dart';
import '../../widgets/my_appbar.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: MyAppbar(title: 'Home', hasTabs: true), // Use your custom AppBar widget
        body: TabBarView(
          children: [
            NewestView(), // First tab view
            ForYouView(), // Second tab view
          ],
        ),
      ),
    );
  }
}