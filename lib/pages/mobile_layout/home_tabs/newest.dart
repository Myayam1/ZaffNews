import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaffnews/component_page/card_adapter.dart';
import 'package:zaffnews/controllers/navigation_controller.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/widgets/mobile_layout/mobile_list_item.dart';
import 'package:zaffnews/widgets/mobile_layout/news_carousel_card.dart';

import '../../../constants/colors.dart';
import '../../../models/news_model.dart';

class MobileNewestView extends StatelessWidget {
  final List<NewsModel> items = newestArticles;
  final List<NewsModel> carouselItems = trendingNews;

  @override
  Widget build(BuildContext context) {
    final NavigationController dashboardController = Get.find();

    return SingleChildScrollView(
      child: Column(
        children: [
          MobileListItem(text: "Trending News", isSubheading: true, onPressed: () { dashboardController.selectedIndex.value = 1; }),
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
                  return MobileNewsCarouselCard(model: item);
                },
              );
            }).toList(),
          ),
          MobileListItem(text: "Newest Articles", isSubheading: true, isClickable: false),
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
