import 'package:flutter/material.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/controllers/database_controller.dart';
import 'package:zaffnews/data/news_data.dart';
import 'package:zaffnews/helpers/overlay_helper.dart';
import 'package:zaffnews/models/list_model.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:get/get.dart';

List<ListModel> bottomSheetList(NewsModel article) { // Pass the article as a parameter
  final DatabaseController databaseController = Get.find<DatabaseController>(); // Get the DatabaseController instance
  List<List<NewsModel>> newsLists = [newestArticles, newsForYou, trendingNews];
  databaseController.loadSavedArticles();

  return [
    ListModel(
      text: !article.isSaved ? "Add to saved articles" : "Saved",
      leadingIcon: !article.isSaved ? Icons.bookmark_border : Icons.bookmark,
      onPressed: () async {
        if (!article.isSaved) {
          print('Saving article: ${article.headline}');
          for (var newsList in newsLists) {
            if (newsList.contains(article)) {
              int index = newsList.indexOf(article);
              if (index != -1) { // Ensure the index is valid
                newsList[index].isSaved = true;
              }
            }
          }

          newestArticles = newsLists[0];
          newsForYou = newsLists[1];
          trendingNews = newsLists[2];

          article.isSaved = true;
          await databaseController.saveArticle(article).then((_) {
            Get.back();
            showMySnackbar(title: 'Article has been saved.', actionLabel: 'SEE ALL', actionCallback: () { Get.toNamed('/saved'); });
          });
        } else {
          print('Deleting article: ${article.headline}');
          for (var newsList in newsLists) {
            if (newsList.contains(article)) {
              int index = newsList.indexOf(article);
              if (index != -1) { // Ensure the index is valid
                newsList[index].isSaved = false;
              }
            }
          }

          newestArticles = newsLists[0];
          newsForYou = newsLists[1];
          trendingNews = newsLists[2];

          article.isSaved = false;
          await databaseController.deleteSavedArticle(article.headline).then((_) {
            Get.back();
            showMySnackbar(title: 'Article deleted.', actionLabel: 'UNDO', actionCallback: () async {
              print('Saving article: ${article.headline}');
              for (var newsList in newsLists) {
                if (newsList.contains(article)) {
                  int index = newsList.indexOf(article);
                  if (index != -1) { // Ensure the index is valid
                    newsList[index].isSaved = true;
                  }
                }
              }

              newestArticles = newsLists[0];
              newsForYou = newsLists[1];
              trendingNews = newsLists[2];

              article.isSaved = true;
              await databaseController.saveArticle(article).then((_) {
                Get.back();
              });
            });
          });
        }
      },
      isClickable: true
    ),
    ListModel(
      text: "Share",
      leadingIcon: Icons.share,
      onPressed: () {
        // Add sharing functionality here
      },
    ),
    ListModel(
      text: "Hide all articles from this channel",
      leadingIcon: Icons.block,
      hasDivider: true,
      onPressed: () async {
        await databaseController.blockChannel(article.channelName); // Block the channel
        Get.back(); // Close the bottom sheet
      },
      isClickable: true
    ),
    ListModel(
      text: "Report Content",
      leadingIcon: Icons.report,
      onPressed: () {
        // Add reporting functionality here
      },
    ),
  ];
}


List<ListModel> accountList = [
  ListModel(
    text: "Notifications",
    leadingIcon: Icons.notifications_none_outlined,
    trailingIcon: Icons.navigate_next,
    isClickable: true
  ),
  ListModel(
    text: "Saved Articles",
    leadingIcon: Icons.bookmark_border,
    onPressed: () {Get.toNamed('/saved');},
      trailingIcon: Icons.navigate_next,
    isClickable: true
  ),
  ListModel(
    text: "Blocked channels",
    hasDivider: true,
    leadingIcon: Icons.block,
    onPressed: () {Get.toNamed('/blocked-channels');},
    trailingIcon: Icons.navigate_next,
    isClickable: true
  ),
  ListModel(
    text: "Rate us",
    leadingIcon: Icons.star_border_outlined,
    trailingIcon: Icons.open_in_new,
    isClickable: true
  ),
  ListModel(
    text: "Log out",
    leadingIcon: Icons.logout,
    color: warningForeground
  ),
];