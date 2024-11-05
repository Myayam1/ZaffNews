import 'package:flutter/material.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/models/news_model.dart';

import '../../helpers/overlay_helper.dart';
import '../my_icon_button.dart';

class TabletNewsCard extends StatelessWidget {
  final NewsModel model;
  const TabletNewsCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final double maxWidth = (MediaQuery.of(context).size.width - 146) / 2;

    return Material(
      color: Colors.white,
      child: InkWell(
        splashColor: inactiveText1,
        child: Row( children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: maxWidth,
                      child: AspectRatio(
                        aspectRatio: 9 / 5,
                        child: Image.asset(model.newsImagePath, fit: BoxFit.fitWidth),
                      ),
                    ),
                    Container(
                      width: maxWidth,
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row( // Channel
                            children: [
                              ClipOval(
                                child: model.channelImagePath.isNotEmpty
                                    ? Image.asset(
                                  model.channelImagePath,
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
                              MyIconButton(icon: Icons.more_vert, onPressed: () { showMyBottomSheet(model); }, size: 18)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
