import 'package:flutter/material.dart';

class ListModel {
  final String text;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final Color? color;
  final bool? isClickable;
  final bool? isSubheading;
  final bool? hasDivider;
  final VoidCallback? onPressed;

  ListModel({
    required this.text,
    this.leadingIcon,
    this.trailingIcon,
    this.color,
    this.isClickable,
    this.isSubheading,
    this.hasDivider,
    this.onPressed
  });
}