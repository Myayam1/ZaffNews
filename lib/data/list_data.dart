import 'package:flutter/material.dart';
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