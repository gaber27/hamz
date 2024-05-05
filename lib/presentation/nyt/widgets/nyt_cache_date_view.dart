import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamztask/core/network/local.dart';
import 'package:hamztask/presentation/nyt/widgets/nyt_item_view.dart';

class CachDataView extends StatelessWidget {
  CachDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the cached data from the local storage
    final jsonString = CachHelper.getData(key: 'cachedDate');

    // Parse the cached JSON data
    final List<dynamic> jsonData = jsonDecode(jsonString);

    return ListView.builder(
      itemCount: jsonData.length,
      itemBuilder: (context, index) {
        final article = jsonData[index];

        // Perform null checks before accessing properties
        final title = article['title'] ?? '';
        final slugName = article['slug_name'] ?? '';
        final multimedia = article['multimedia'] ?? [];
        final imageUrl = multimedia.isNotEmpty ? multimedia[0]['url'] ?? '' : '';

        return NytItemView(
          img: imageUrl,
          title: title,
          desc: slugName,
        );
      },
    );
  }
}
