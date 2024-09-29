import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/widgets/my_appbar.dart';
import 'package:zaffnews/widgets/my_list_item.dart';
import 'package:zaffnews/widgets/news_card.dart';
import 'package:zaffnews/widgets/news_card_secondary.dart';
import 'package:zaffnews/widgets/news_carousel_card.dart';
import 'package:zaffnews/data/news_data.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(title: "Home", showSearch: true),
      body: Column(
        children: [
          Divider(height: 2.0, color: dividerColor),

          MyNewsCarouselCard(model: news[0]),

          MyListItem(
            text: 'Trending News',
            isSubheading: true,
            isRedirect: true,
          ),
          Divider(height: 1.0, color: dividerColor),
          MySecondaryNewsCard(model: news[0]),
          MyNewsCard(model: news[0]),
        ]
      ),
    );
  }
}
