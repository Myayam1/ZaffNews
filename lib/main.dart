import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:zaffnews/bindings/bindings.dart';
import 'package:zaffnews/controllers/database_controller.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/pages/bottom_nav_container.dart';
import 'package:zaffnews/pages/bottom_nav_pages/home.dart';
import 'package:zaffnews/pages/sub_pages/blocked_channels.dart';
import 'package:zaffnews/pages/sub_pages/saved_articles.dart';
import 'package:zaffnews/pages/sub_pages/search_page.dart';
import 'package:zaffnews/widgets/bottom_sheet.dart';

import 'controllers/tab_controller.dart';
import 'data/news_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final DatabaseController databaseController = Get.put(DatabaseController());
  await databaseController.loadSavedArticles();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      initialBinding: MyBindings(),
      getPages: [
        GetPage(name: '/', page: () => DashboardPage()),
        GetPage(name: '/search', page: () => MySearchPage()),
        GetPage(name: '/blocked-channels', page: () => MyBlockedChannelsPage()),
        GetPage(name: '/saved', page: () => MySavedArticlesPage()),
      ],
    );
  }
}