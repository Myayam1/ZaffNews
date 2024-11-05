import 'package:flutter/material.dart';
import 'package:zaffnews/component_page/tablet_card_adapter.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/widgets/mobile_layout/mobile_appbar.dart';

class TabletTrendingPage extends StatelessWidget {
  const TabletTrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabletNewsAdapter(models: trendingNews),
          ],
        ),
      );
  }
}
