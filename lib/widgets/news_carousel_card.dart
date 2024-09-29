import 'package:flutter/material.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/my_icon_button.dart';

class MyNewsCarouselCard extends StatelessWidget {
  final NewsModel model;

  const MyNewsCarouselCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(model.newsImagePath, fit: BoxFit.fitWidth)
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                gradient: overlayGradient
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            padding: EdgeInsets.all(10.0),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    width: 315,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row( // Channel
                          children: [
                            ClipOval(
                              child: model.channelImagePath != null && model.channelImagePath!.isNotEmpty
                                  ? Image.asset(
                                model.channelImagePath!,
                                width: 24,
                                height: 24,
                                fit: BoxFit.cover,
                              )
                                  : Icon(
                                Icons.account_circle,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              model.channelName,
                              style: TextStyle(
                                color: inactiveText2,
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                height: 0.17,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          model.headline,
                          softWrap: true,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 5),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            model.timeUploaded,
                            style: TextStyle(
                              color: inactiveText2,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: MyIconButton(icon: Icons.more_vert, onPressed: () {}, size: 18, color: inactiveText2)
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

