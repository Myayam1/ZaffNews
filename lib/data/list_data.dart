import 'package:flutter/material.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/models/list_model.dart';

List<ListModel> bottomSheetList = [
  ListModel(
    text: "Add to saved articles",
    leadingIcon: Icons.bookmark_border
  ),
  ListModel(
    text: "Share",
    leadingIcon: Icons.share
  ),
  ListModel(
    text: "Hide all articles from this channel",
    hasDivider: true,
    leadingIcon: Icons.block
  ),
  ListModel(
    text: "Report Content",
    leadingIcon: Icons.bookmark_border
  ),
];

List<ListModel> accountList = [
  ListModel(
    text: "Notifications",
    leadingIcon: Icons.notifications_none_outlined,
    isRedirect: true
  ),
  ListModel(
    text: "Saved Articles",
    leadingIcon: Icons.bookmark_border,
    isRedirect: true
  ),
  ListModel(
    text: "Blocked channels",
    hasDivider: true,
    leadingIcon: Icons.block,
    isRedirect: true
  ),
  ListModel(
    text: "Rate us",
    leadingIcon: Icons.star_border_outlined,
    trailingIcon: Icons.open_in_new,
    isRedirect: true
  ),
  ListModel(
    text: "Log out",
    leadingIcon: Icons.logout,
    color: warningForeground
  ),
];