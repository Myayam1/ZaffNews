import 'package:flutter/material.dart';
import 'package:zaffnews/models/list_model.dart';

import '../widgets/my_list_item.dart';

class ListAdapter extends StatelessWidget {
  final List<ListModel> items;

  const ListAdapter({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((entry) {
        return MyListItem(
          text: entry.text,
          leadingIcon: entry.leadingIcon,
          trailingIcon: entry.trailingIcon,
          isSubheading: entry.isSubheading,
          color: entry.color,
          onPressed: entry.onPressed,
          isClickable: entry.isClickable,
          hasDivider: entry.hasDivider,
        );
      }).toList(),
    );
  }
}