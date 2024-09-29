import 'package:flutter/material.dart';

class ListModel {
  final String text;
  final IconData? leadingIcon;
  final bool? isDisabled;
  final bool? isRedirect;
  final bool? isSubheading;
  final bool? hasDivider;
  final VoidCallback? onPressed;

  ListModel({
    required this.text,
    this.leadingIcon,
    this.isDisabled,
    this.isRedirect,
    this.isSubheading,
    this.hasDivider,
    this.onPressed
  });
}