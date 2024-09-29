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
          isSubheading: entry.isSubheading,
          onPressed: entry.onPressed,
          isRedirect: entry.isRedirect,
          hasDivider: entry.hasDivider,
          isDisabled: entry.isDisabled,
        );
      }).toList(),
    );
  }
}