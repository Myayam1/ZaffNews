import 'package:flutter/material.dart';
import 'package:zaffnews/widgets/bottom_sheet.dart'; // Adjust the import according to your file structure

void showMyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      return const MyBottomSheet(); // No need for key here since it is const
    },
  );
}
