import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaffnews/controllers/database_controller.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/sub_menu_appbar.dart';
import '../../component_page/card_adapter.dart';

class MySavedArticlesPage extends StatelessWidget {
  MySavedArticlesPage({super.key});

  final DatabaseController databaseController = Get.find<DatabaseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MySubAppbar(title: "Saved Articles"),
      body: Obx(() { // Use Obx to reactively listen for changes
        List<NewsModel> items = databaseController.savedArticles;
        if (items.isEmpty) {
          return Center(child: Text("No saved articles."));
        }
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
      }),
    );
  }
}
