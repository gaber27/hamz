import 'package:flutter/material.dart';
import 'package:hamztask/core/widgets/shimmer_item.dart';

class NytLoadingView extends StatelessWidget {
  const NytLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => const ShimmerItem(),);
  }
}
