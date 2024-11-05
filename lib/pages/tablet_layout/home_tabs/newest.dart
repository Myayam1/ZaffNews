import 'package:flutter/material.dart';
import 'package:zaffnews/data/news_data.dart';

import '../../../component_page/tablet_card_adapter.dart';
import '../../../constants/colors.dart';

class TabletNewestView extends StatelessWidget {
  const TabletNewestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0)
        ),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TabletNewsAdapter(models: newestArticles),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
