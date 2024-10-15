import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zaffnews/models/news_model.dart';

import '../data/news_data.dart'; // Make sure you have a proper model defined for NewsModel

class DatabaseController extends GetxController {
  static Database? _db;

  List<List<NewsModel>> newsLists = [newestArticles, newsForYou, trendingNews];
  var savedArticles = <NewsModel>[].obs;
  var blockedChannels = <String>[].obs;

  void onInit() {
    super.onInit();
    loadSavedArticles(); // Load articles when the controller is initialized
    loadBlockedChannels();
  }

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'news_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE saved_articles(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            channelImagePath TEXT, 
            channelName TEXT,
            headline TEXT,
            timeUploaded TEXT,
            newsImagePath TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE blocked_channels(
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            channelName TEXT
          )
        ''');
      },
    );
  }

  // Insert saved article
  Future<int> saveArticle(NewsModel article) async {
    var dbClient = await db;
    print('Saving article: ${article.toMap()}');
    int result = await dbClient!.insert('saved_articles', article.toMap());
    loadSavedArticles(); // Reload saved articles
    return result;
  }

  // Load saved articles
  Future<void> loadSavedArticles() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('saved_articles');

    // Load saved articles into savedArticles list
    savedArticles.assignAll(queryResult.map((data) => NewsModel.fromMap(data)).toList());

    // Update isSaved for articles in savedArticles
    for (var savedArticle in savedArticles) {
      savedArticle.isSaved = true; // Ensure all articles in savedArticles are marked as saved
    }

    // Update isSaved for articles in newsLists
    for (var savedArticle in savedArticles) {
      for (var newsList in newsLists) {
        for (var article in newsList) {
          // Compare on a unique property, such as headline
          if (article.headline == savedArticle.headline) {
            article.isSaved = true; // Update the article's isSaved property
          }
        }
      }
    }

    // Update the news lists with the modified articles
    newestArticles = newsLists[0];
    newsForYou = newsLists[1];
    trendingNews = newsLists[2];
  }


  // Block a channel
  Future<int> blockChannel(String channelName) async {
    var dbClient = await db;
    int result = await dbClient!.insert('blocked_channels', {'channelName': channelName});
    loadBlockedChannels(); // Reload blocked channels
    return result;
  }

  // Load blocked channels
  Future<void> loadBlockedChannels() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('blocked_channels');
    blockedChannels.assignAll(queryResult.map((data) => data['channelName'] as String).toList());
  }

  // Delete saved article by headline
  Future<int> deleteSavedArticle(String headline) async {
    var dbClient = await db;
    int result = await dbClient!.delete(
      'saved_articles',
      where: 'headline = ?',
      whereArgs: [headline],
    );
    loadSavedArticles(); // Reload saved articles after deletion
    return result;
  }

  // Unblock a channel by channelName
  Future<int> unblockChannel(String channelName) async {
    var dbClient = await db;
    int result = await dbClient!.delete(
      'blocked_channels',
      where: 'channelName = ?',
      whereArgs: [channelName],
    );
    loadBlockedChannels(); // Reload blocked channels after unblocking
    return result;
  }
}
