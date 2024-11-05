import 'package:flutter/material.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/mobile_layout/news_card.dart';
import 'package:zaffnews/widgets/mobile_layout/news_card_secondary.dart';

class NewsAdapter extends StatelessWidget {
  final NewsModel model;
  final bool isSecondary;
  final bool hasDivider;

  const NewsAdapter({
    Key? key,
    required this.model,
    this.isSecondary = false,
    this.hasDivider = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSecondary
        ? MobileSecondaryNewsCard(model: model) // Show secondary card
        : MobileNewsCard(model: model, hasDivider: hasDivider); // Show primary card
  }
}
