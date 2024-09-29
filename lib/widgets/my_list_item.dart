import 'package:flutter/material.dart';
import '../constants/colors.dart'; // Adjust the path accordingly

class MyListItem extends StatelessWidget {
  final String text;
  final IconData? leadingIcon;
  final bool? isDisabled;
  final bool? isClickable;
  final bool? isSubheading;
  final VoidCallback? onPressed;

  const MyListItem({
    Key? key,
    required this.text,
    this.leadingIcon,
    this.isDisabled,
    this.isClickable,
    this.isSubheading,
    this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSubheading = this.isSubheading ?? false;
    final bool isClickable = this.isSubheading ?? false;
    final bool isDisabled = this.isSubheading ?? false;

    return Material(
      color: isClickable ? isSubheading ? backgroundColor : Colors.white : Colors.transparent,
      child: InkWell(
        onTap: isClickable && !isDisabled ? onPressed : () {},
        splashColor: Colors.grey.withOpacity(0.2), // Optional: Set splash color
        child: Container(
          width: MediaQuery.of(context).size.width, // Ensures the Row has a finite width
          height: isSubheading ? 55 : 48,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              if (leadingIcon != null && !isSubheading)
                Icon(leadingIcon, size: 24),
              SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: foregroundColor,
                    fontSize: isSubheading ? 15 : 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.50,
                  ),
                ),
              ),
              SizedBox(width: 16),
              if (isClickable)
                Icon(Icons.navigate_next, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
