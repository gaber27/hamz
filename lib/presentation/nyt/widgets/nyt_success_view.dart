import 'package:flutter/material.dart';
import 'package:hamztask/bloc/nyt/nyt_states.dart';
import 'package:hamztask/presentation/nyt/widgets/nyt_item_view.dart';

class NytSuccessView extends StatelessWidget {
  const NytSuccessView({super.key, required this.state});

  final NYTFetchArticleSuccess state; // Define state as NYTFetchArticleSuccess

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.articles.length,
      itemBuilder: (context, index) {
        final article = state.articles[index];
        return NytItemView(img: article.imageUrl, title: article.slugName, desc: article.title);
      },
    );
  }
}
