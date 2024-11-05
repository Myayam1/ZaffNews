import 'package:flutter/material.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/models/news_model.dart';

import '../../../component_page/card_adapter.dart';

class MobileForYouView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<NewsModel> items = newsForYou;

    return SingleChildScrollView(
      child: Column(
        children: items.map((entry) {
          return NewsAdapter(
            model: entry,
            hasDivider: items.last == entry ? false : true,
          );
        }).toList(),
      ),
    );
  }
}