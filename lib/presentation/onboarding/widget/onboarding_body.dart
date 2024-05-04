import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamztask/bloc/onboarding/onboarding_bloc.dart';
import 'package:hamztask/core/constant/colors.dart';
import 'package:hamztask/core/constant/img.dart';
import 'package:hamztask/core/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/material.dart';
import '../../../core/constant/sizes.dart';
import '../../../core/widgets/space.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState(); // Initializing animation controller
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this); // Creating animation
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut)); // Repeating animation
    _controller.repeat(reverse: true);
  }

    @override
  Widget build(BuildContext context) {
    final onBoardingBloc = BlocProvider.of<OnBoardingBloc>(context); // Getting OnBoardingBloc instance
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(Images.splashAnimation),
        VerticalSpace(Sizes.btwWidget,),
        // GestureDetector to start speech recognition
        GestureDetector(
          onTap: () {
            onBoardingBloc.repository.startSpeechRecognition(context: context);
          },
          child: ScaleTransition(
            scale: _animation,
            child: Center(
              child: Container(
                width: Sizes.tenSize,
                height: Sizes.tenSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(Sizes.circleRadius,),
                  color: secondColor
                ),
                child: Center(
                    child: Icon(Icons.mic,color: mainColor,)
                ),
              ),
            ),
          ),
        ),
        VerticalSpace(Sizes.btwWidget,),
        Text('Click the Mic and say "Hello" to start',style: appTheme.textTheme.bodyMedium,)
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();  // Disposing animation controller
    super.dispose();
  }
}
