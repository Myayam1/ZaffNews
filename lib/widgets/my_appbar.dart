import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors.dart';
import 'my_icon_button.dart'; // Adjust the import based on your file structure

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showSearch;

  const MyAppbar({
    Key? key,
    required this.title,
    this.showSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      flexibleSpace: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            color: backgroundColor, 
            height: 60.0, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Leading section (Logo)
                SizedBox(
                  width: 30,
                  height: 20.46,
                  child: SvgPicture.asset(
                    'lib/assets/zn_logo.svg',
                    fit: BoxFit.contain,
                    width: 30,
                    height: 20.46,
                  ),
                ),
          
                // Title in the middle
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
          
                // Actions (Search icon)
                if (showSearch)
                  MyIconButton(
                    icon: Icons.search,
                    onPressed: () {},
                  )
                else
                  SizedBox(width: 24), // Placeholder to maintain space
              ],
            ),
          ),
        ),
      ),
    );

  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}