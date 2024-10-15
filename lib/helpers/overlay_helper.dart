import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/bottom_sheet.dart'; // Adjust the import according to your file structure

void showMyBottomSheet(NewsModel model) {
  Get.bottomSheet(
    MyBottomSheet(newsModel: model), // Your bottom sheet widget
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    isScrollControlled: true, // Optional, if the sheet should be scrollable
    backgroundColor: Colors.white, // Optional, to set the background color
  );
}

void showMySnackbar({
  required String title,
  Color backgroundColor = snackBarBackground,
  Color textColor = onBackgroundTextColor,
  Color actionLabelColor = foregroundActiveColor,
  SnackPosition snackPosition = SnackPosition.BOTTOM,
  Duration duration = const Duration(seconds: 2),
  VoidCallback? actionCallback,
  String? actionLabel,
}) {
  Get.snackbar(
    title,
    '',
    snackPosition: snackPosition,
    backgroundColor: backgroundColor,
    colorText: textColor,
    duration: duration,
    mainButton: actionLabel != null && actionCallback != null
        ? TextButton(
      onPressed: actionCallback,
      child: Text(
        actionLabel,
        style: TextStyle(color: actionLabelColor),
      ),
    )
        : null,
  );
}

