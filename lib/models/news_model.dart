import 'package:flutter/material.dart';

class NewsModel {
  final String? channelImagePath;
  final String channelName, headline, timeUploaded, newsImagePath;
  final bool isSaved;

  NewsModel({this.channelImagePath, required this.channelName, required  this.headline, required this.timeUploaded, required this.newsImagePath, required this.isSaved});
}