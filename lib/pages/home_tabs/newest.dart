import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaffnews/component_page/card_adapter.dart';
import 'package:zaffnews/controllers/dashboard_controller.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/widgets/my_list_item.dart';
import 'package:zaffnews/widgets/news_carousel_card.dart';

import '../../constants/colors.dart';
import '../../models/news_model.dart';

class NewestView extends StatelessWidget {
  final List<NewsModel> items = newestArticles;
  final List<NewsModel> carouselItems = trendingNews;

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();

    return SingleChildScrollView(
      child: Column(
        children: [
          MyListItem(text: "Trending News", isSubheading: true, onPressed: () { dashboardController.selectedIndex.value = 1; }),
          Divider(height: 1.0, color: dividerColor),
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 5),
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              viewportFraction: 1.0
            ),
            items: carouselItems.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return MyNewsCarouselCard(model: item);
                },
              );
            }).toList(),
          ),
          MyListItem(text: "Newest Articles", isSubheading: true, isClickable: false),
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
