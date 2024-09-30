import 'package:flutter/material.dart';
import 'package:zaffnews/component_page/card_adapter.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/widgets/my_list_item.dart';
import 'package:zaffnews/widgets/news_carousel_card.dart';

import '../../constants/colors.dart';
import '../../models/news_model.dart';

class NewestView extends StatelessWidget {
  final List<NewsModel> items = news;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyListItem(text: "Trending News", isSubheading: true),
          Divider(height: 1.0, color: dividerColor),
          MyNewsCarouselCard(model: news[0]),
          MyListItem(text: "Newest Articles", isSubheading: true, isRedirect: false),
          Divider(height: 1.0, color: dividerColor),
          Column(
            children: items.map((entry) {
              return NewsAdapter(
                model: entry,
                isSecondary: true,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
