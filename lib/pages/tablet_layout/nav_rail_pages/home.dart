import 'package:flutter/material.dart';
import 'package:zaffnews/pages/tablet_layout/home_tabs/for_you.dart';
import 'package:zaffnews/pages/tablet_layout/home_tabs/newest.dart';
import 'package:zaffnews/widgets/tablet_layout/tablet_appbar.dart';

class TabletHomePage extends StatelessWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: TabletAppbar(title: 'Home', hasTabs: true),
        body: TabBarView(
          children: [
            TabletNewestView(),
            TabletForYouView()
          ],
        ),
      )
    );
  }
}
