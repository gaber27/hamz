import 'package:flutter/material.dart';

import '../../../core/constant/sizes.dart';
import '../../../core/functions/navigtor.dart';
import '../../../core/theme.dart';
import '../../../core/widgets/space.dart';
import '../pages/nyt_artical_view.dart';

class NytItemView extends StatelessWidget {
  const NytItemView({super.key, required this.img, required this.title, required this.desc});
  final String img ;
  final String title ;
  final String desc ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.btwWidget),
      child: GestureDetector(
        onTap: () {
          navigate(context: context, nextPageBuilder: (context) {
            return FullScreenNytItemView(
              img: img,
              title: title,
              desc: desc,
            );
          });

        },
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(Sizes.circleRadius),
                child: Image.network(img,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                      width: Sizes.tenSize,
                      height: Sizes.tenSize,
                      fit: BoxFit.fill,
                    );
                  },
                )),
            HorizontalSpace(Sizes.btwWidget),
            SizedBox(
              width: Sizes.maxTextWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(maxLines: 1 ,title,style: appTheme.textTheme.bodyMedium,),
                  Text(maxLines: 2,desc,style: appTheme.textTheme.bodySmall,overflow: TextOverflow.ellipsis,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
