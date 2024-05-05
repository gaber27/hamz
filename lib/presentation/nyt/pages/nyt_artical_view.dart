import 'package:flutter/material.dart';
import '../../../core/constant/sizes.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/space.dart';

class FullScreenNytItemView extends StatelessWidget {
  final String img;
  final String title;
  final String desc;

  const FullScreenNytItemView({super.key, required this.img, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Article',style: appTheme.textTheme.bodyLarge,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            img,width: Sizes.fullWidth,height: Sizes.coverHeight,colorBlendMode: BlendMode.overlay,fit: BoxFit.fill,
            errorBuilder: (context, error, stackTrace) {
              return Image.network(
                'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                width: Sizes.fullWidth,
                height: Sizes.coverHeight,
                fit: BoxFit.fill,
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(Sizes.btwWidget),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: appTheme.textTheme.bodyLarge,
                ),
                VerticalSpace(Sizes.btwWidget),
                Text(
                  desc,
                  style: appTheme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}