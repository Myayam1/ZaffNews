import 'package:flutter/material.dart';
import 'package:zaffnews/widgets/mobile_layout/mobile_appbar.dart';

import '../../../component_page/card_adapter.dart';
import '../../../data/news_data.dart';
import '../../../models/news_model.dart';

class MobileTrendingPage extends StatelessWidget {
  const MobileTrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NewsModel> items = trendingNews;

    return Scaffold(
      appBar: MobileAppbar(title: "Trending News"),
      body: SingleChildScrollView(
        child: Column(
          children: items.map((entry) {
            return NewsAdapter(
              model: entry,
              isSecondary: true,
            );
          }).toList(),
        ),
      ),
    );
  }
}
