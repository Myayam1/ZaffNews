import 'package:flutter/material.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/helpers/overlay_helper.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/my_icon_button.dart';

class MobileNewsCarouselCard extends StatelessWidget {
  final NewsModel model;

  const MobileNewsCarouselCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 200.0;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: cardHeight,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset( model.newsImagePath, fit: BoxFit.fitWidth)
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: cardHeight,
            decoration: BoxDecoration(
                gradient: overlayGradient
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: cardHeight,
            padding: EdgeInsets.all(20.0),
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
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              )
                                  : Icon(
                                Icons.account_circle,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 7),
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
                      child: MyIconButton(icon: Icons.more_vert, onPressed: () { showMyBottomSheet(model); }, size: 18, color: inactiveText2)
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

