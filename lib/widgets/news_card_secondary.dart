import 'package:flutter/material.dart';
import 'package:zaffnews/models/news_model.dart';

import '../constants/colors.dart';
import '../helpers/bottom_sheet_helper.dart';
import 'my_icon_button.dart';

class MySecondaryNewsCard extends StatelessWidget {
  final NewsModel model;

  const MySecondaryNewsCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Image.asset(model.newsImagePath, fit: BoxFit.fitWidth),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row( // Channel
                  children: [
                    ClipOval(
                      child: model.channelImagePath != null && model.channelImagePath!.isNotEmpty
                          ? Image.asset(
                        model.channelImagePath!,
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      )
                          : Icon(
                        Icons.account_circle,
                        size: 16,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      model.channelName,
                      style: TextStyle(
                        color: inactiveText1,
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                SizedBox(
                  width: 328,
                  child: Text(
                    model.headline,
                    style: TextStyle(
                      color: foregroundColor,
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.50,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      model.timeUploaded,
                      style: TextStyle(
                        color: inactiveText1,
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    MyIconButton(icon: Icons.more_vert, onPressed: () { showMyBottomSheet(context); }, size: 18)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
