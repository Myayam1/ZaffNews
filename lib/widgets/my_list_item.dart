import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MyListItem extends StatelessWidget {
  final String text;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final bool? isDisabled;
  final bool? isRedirect;
  final bool? isSubheading;
  final bool? hasDivider;
  final Color? color;
  final VoidCallback? onPressed;

  const MyListItem({
    Key? key,
    required this.text,
    this.trailingIcon,
    this.leadingIcon,
    this.isDisabled,
    this.isRedirect = true,
    this.isSubheading,
    this.onPressed,
    this.color,
    this.hasDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isClickable = isRedirect ?? false;
    final bool isDisabled = this.isDisabled ?? false;
    final Color color = this.color ?? foregroundColor;

    return Material(
      color: isClickable ? (isSubheading ?? false ? backgroundColor : Colors.white) : Colors.transparent,
      child: InkWell(
        onTap: isClickable && !isDisabled ? onPressed : () {},
        splashColor: Colors.blue.withOpacity(0.5), // Optional: Set splash color
        child: Column(
          children: [
            Container(
              width: double.infinity, // Use double.infinity for full width
              height: isSubheading ?? false ? 55 : 48,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  if (leadingIcon != null && !(isSubheading ?? false))
                    Icon(leadingIcon, size: 24, color: color),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        color: color,
                        fontSize: isSubheading ?? false ? 15 : 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.50,
                      ),
                    ),
                  ),
                  if (trailingIcon != null)
                    Icon(trailingIcon, color: color)
                  else if (isClickable)
                    Icon(Icons.navigate_next, size: 24, color: color),
                ],
              ),
            ),
            if (hasDivider ?? false) Container(height: 1.0, color: dividerColor),
          ],
        ),
      ),
    );
  }
}
