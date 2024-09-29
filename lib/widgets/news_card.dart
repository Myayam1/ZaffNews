import 'package:flutter/material.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/helpers/bottom_sheet_helper.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/my_icon_button.dart';

class MyNewsCard extends StatelessWidget {
  final NewsModel model;

  const MyNewsCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 135,
          padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 15.0),
          child: Row(
            children: [
              Container(
                width: 243,
                child: Column( // Main section
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
                    Spacer(),
                    Text(
                      model.timeUploaded,
                      style: TextStyle(
                        color: inactiveText1,
                        fontSize: 11,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(model.newsImagePath), // Use AssetImage for the image
                        fit: BoxFit.cover, // This will ensure the image covers the container
                      ),
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                  ),
                  Spacer(),
                  MyIconButton(icon: Icons.more_vert, onPressed: () { showMyBottomSheet(context); }, size: 18)
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
