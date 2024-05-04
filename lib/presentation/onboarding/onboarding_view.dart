import 'package:flutter/material.dart';
import 'package:hamztask/core/constant/colors.dart';
import 'package:hamztask/core/constant/sizes.dart';
import 'package:hamztask/presentation/onboarding/widget/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: mainColor,toolbarHeight: Sizes.btwWidget,) ,
      body: const OnBoardingViewBody(),
    );
  }
}
