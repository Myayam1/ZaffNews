import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final double? size; // Made size nullable
  final IconData icon;
  final Color? color;
  final VoidCallback onPressed;

  const MyIconButton({
    Key? key,
    this.size, // Optional size
    this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double effectiveSize = size ?? 24;

    return SizedBox(
      width: effectiveSize,
      height: effectiveSize,
      child: IconButton(
        icon: Icon(icon, size: effectiveSize),
        onPressed: onPressed,
        iconSize: effectiveSize,
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(
          minWidth: effectiveSize,
          minHeight: effectiveSize,
        ),
        color: color,
      ),
    );
  }
}
