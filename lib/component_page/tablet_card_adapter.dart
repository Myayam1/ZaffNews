import 'package:flutter/material.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/mobile_layout/news_card.dart';
import 'package:zaffnews/widgets/mobile_layout/news_card_secondary.dart';
import 'package:zaffnews/widgets/tablet_layout/news_card.dart';

class TabletNewsAdapter extends StatelessWidget {
  final List<NewsModel> models;

  const TabletNewsAdapter({
    Key? key,
    required this.models,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<NewsModel> leftModels = [for (var i = 0; i < models.length; i += 2) models[i]];
    final List<NewsModel> rightModels = [for (var i = 1; i < models.length; i += 2) models[i]];

    return Row(
      children: [
        SizedBox(width: 24.0,),
        Column(
          children: leftModels.map((model) {
            return TabletNewsCard(model: model);
          }).toList()
        ),
        SizedBox(width: 16.0,),
        Column(
            children: rightModels.map((model) {
              return TabletNewsCard(model: model);
            }).toList()
        ),
        SizedBox(width: 24.0,)
      ],
    );
  }
}


