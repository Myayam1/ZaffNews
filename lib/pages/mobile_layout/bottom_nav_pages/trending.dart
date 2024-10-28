import 'package:flutter/material.dart';
import 'package:zaffnews/widgets/my_appbar.dart';

import '../../../component_page/card_adapter.dart';
import '../../../data/news_data.dart';
import '../../../models/news_model.dart';

class MyTrendingPage extends StatelessWidget {
  const MyTrendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<NewsModel> items = trendingNews;

    return Scaffold(
      appBar: MyAppbar(title: "Trending News"),
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
