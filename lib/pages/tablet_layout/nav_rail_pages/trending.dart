import 'package:flutter/material.dart';
import 'package:zaffnews/component_page/tablet_card_adapter.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/widgets/tablet_layout/tablet_appbar.dart';

class TabletTrendingPage extends StatelessWidget {
  const TabletTrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabletAppbar(title: 'Trending News'),
      body: Container(
        color: backgroundColor,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0)
          ),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TabletNewsAdapter(models: trendingNews),
                ],
              ),
              ),
          ),
        ),
      ),
    );
  }
}
