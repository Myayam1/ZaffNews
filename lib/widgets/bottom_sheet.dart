import 'package:flutter/material.dart';
import 'package:zaffnews/component_page/list_adapter.dart';
import 'package:zaffnews/data/list_data.dart';
import '../constants/colors.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({super.key}); // Ensure the key is here

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          // Drag handle
          Container(
            height: 4,
            width: 32,
            decoration: BoxDecoration(
              color: foregroundColor,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          Spacer(),
          ListAdapter(items: bottomSheetList),
        ],
      ),
    );
  }
}
