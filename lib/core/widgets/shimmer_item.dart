import 'package:flutter/material.dart';
import 'package:hamztask/core/constant/sizes.dart';
import 'package:hamztask/core/widgets/space.dart';
import 'package:shimmer/shimmer.dart';
import '../constant/colors.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Sizes.btwWidget),
      child: Shimmer.fromColors(
        baseColor: textColor,
        highlightColor: textColor,
        child: Row(
            children: [
              CircleAvatar(
                radius:Sizes.shimmerImageRadius,
                backgroundColor: mainColor,
              ),
              HorizontalSpace(Sizes.btwWidget),
              Column(
                children: [
                  Container(
                    width: Sizes.maxTextWidth,
                    height: Sizes.shimmerTextWidget,
                    color: headingColor,
                  ),
                  VerticalSpace(Sizes.btwWidget),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.circleRadius),
                      color: mainColor,
                    ),
                    width: Sizes.maxTextWidth,
                    height: Sizes.shimmerTextWidget,
                  ),
                ],
              )


            ]
        ),
      ),
    );
  }
}
