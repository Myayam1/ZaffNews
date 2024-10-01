import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';
import 'package:zaffnews/controllers/tab_controller.dart'; // Import your renamed controller
import 'my_icon_button.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearch;
  final bool hasTabs;

  const MyAppbar({
    Key? key,
    required this.title,
    this.showSearch = true,
    this.hasTabs = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabControllerX tabController = Get.find(); // Get the controller instance

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 60.0, // Keep height for the flexible space
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 30,
                height: 20.46,
                child: SvgPicture.asset(
                  'lib/assets/zn_logo.svg',
                  fit: BoxFit.contain,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: foregroundColor,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              if (showSearch)
                MyIconButton(
                  icon: Icons.search,
                  onPressed: () {
                    Get.toNamed('/search');
                  },
                )
              else
                SizedBox(width: 24),
            ],
          ),
        ),
      ),
      bottom: hasTabs ? PreferredSize(
        preferredSize: Size.fromHeight(48.0), // Height for TabBar only
        child: Container(
          padding: EdgeInsets.only(top: 8.0), // Set desired top padding
          child: TabBar(
            onTap: (index) => tabController.changeTab(index), // Update the selected index
            tabs: [
              Tab(text: 'Newest'),
              Tab(text: 'For You'),
            ],
          ),
        ),
      ) : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(hasTabs ? 108.0 : 60.0); // Total height of AppBar + TabBar
}