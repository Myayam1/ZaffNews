import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/widgets/my_icon_button.dart';

class MobileSubAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Function(String)? onSearchChanged;

  const MobileSubAppbar({
    Key? key,
    this.title,
    this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: MyIconButton(icon: Icons.navigate_before, onPressed: () { Get.back(); }),
      title: onSearchChanged != null // Check if the search function is provided
          ? Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: onBackgroundTextColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: Icon(Icons.search, color: onBackgroundTextColor, size: 20,),
              ),
              onChanged: onSearchChanged, // Call the search function when text changes
            ),
          )
          : Text(title ?? ''), // Show title if search is not needed
      bottom: PreferredSize(preferredSize: Size.fromHeight(1.0), child: Container(height: 1.0, color: dividerColor)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(61.0); // Define the preferred size
}
