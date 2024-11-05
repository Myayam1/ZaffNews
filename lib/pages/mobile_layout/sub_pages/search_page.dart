import 'package:flutter/material.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/mobile_layout/sub_menu_appbar.dart';
import '../../../component_page/card_adapter.dart';

class MobileSearchPage extends StatelessWidget {
  final List<NewsModel> allNews = [
    ...newestArticles,
    ...trendingNews,
    ...newsForYou
  ];
  final ValueNotifier<List<NewsModel>> filteredNewsNotifier = ValueNotifier([]);

  MobileSearchPage({Key? key}) : super(key: key) {
    // Initialize the filtered news with all news
    filteredNewsNotifier.value = allNews;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MobileSubAppbar(
        onSearchChanged: (value) {
          // Filter the news based on the input
          filteredNewsNotifier.value = allNews.where((news) {
            return news.headline.toLowerCase().contains(value.toLowerCase()) ||
                news.channelName.toLowerCase().contains(value.toLowerCase());
          }).toList();
        },
      ),
      body: ValueListenableBuilder<List<NewsModel>>(
        valueListenable: filteredNewsNotifier,
        builder: (context, filteredNews, child) {
          return ListView.builder(
            itemCount: filteredNews.length,
            itemBuilder: (context, index) {
              return NewsAdapter(
                model: filteredNews[index],
                hasDivider: filteredNews[index] == filteredNews.last ? false : true,
              );
            },
          );
        },
      ),
    );
  }
}
