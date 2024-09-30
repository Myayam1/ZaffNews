import 'package:flutter/material.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/news_card.dart';
import 'package:zaffnews/widgets/news_card_secondary.dart';

class NewsAdapter extends StatelessWidget {
  final NewsModel model;
  final bool isSecondary;

  const NewsAdapter({
    Key? key,
    required this.model,
    this.isSecondary = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSecondary
        ? MySecondaryNewsCard(model: model) // Show secondary card
        : MyNewsCard(model: model); // Show primary card
  }
}
