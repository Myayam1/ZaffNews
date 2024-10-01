import 'package:flutter/material.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/helpers/bottom_sheet_helper.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/my_icon_button.dart';

class MyNewsCard extends StatelessWidget {
  final NewsModel model;
  final bool hasDivider;

  const MyNewsCard({super.key, required this.model, this.hasDivider = true});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(right: 13.0, left: 13.0, top: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 243,
                    child: Column( // Main section
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        SizedBox(height: 7),
                        Text(
                          model.headline,
                          softWrap: true,
                          style: TextStyle(
                            color: foregroundColor,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(model.newsImagePath), // Use AssetImage for the image
                        fit: BoxFit.fitHeight, // This will ensure the image covers the container
                      ),
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
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
                ]
              ),
              SizedBox(height: 15.0),
              if (hasDivider)
                Container(height: 1.0, color: dividerColor, padding: EdgeInsets.symmetric(horizontal: 40))
            ],
          ),
        ),
      ),
    );
  }
}
