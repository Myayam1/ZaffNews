import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/models/news_model.dart';
import 'package:zaffnews/widgets/mobile_layout/bottom_sheet.dart';
import 'package:zaffnews/widgets/snackbar.dart'; // Adjust the import according to your file structure

void showMyBottomSheet(NewsModel model) {
  Get.bottomSheet(
    MobileBottomSheet(newsModel: model), // Your bottom sheet widget
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    isScrollControlled: true, // Optional, if the sheet should be scrollable
    backgroundColor: Colors.white, // Optional, to set the background color
  );
}

void showMySnackbar({
  required String title,
  VoidCallback? actionCallback,
  String? actionLabel,
}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor: Colors.black,
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      duration: Duration(seconds: 3),
      messageText: MySnackbar(
          title: title,
          onPressed: actionCallback != null ? actionCallback : null,
          actionLabel: actionLabel != null ? actionLabel : null
      )
    )
  );
}

