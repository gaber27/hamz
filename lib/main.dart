import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamztask/bloc/onboarding/onboarding_bloc.dart';
import 'package:hamztask/core/theme.dart';
import 'package:hamztask/data/onboarding_repo/onboarding_repo_impl.dart';
import 'package:hamztask/presentation/onboarding/onboarding_view.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart'; // Import SpeechToText

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => RepositoryProvider(
        create: (context) => OnboardingRepository(speech: SpeechToText()), // Provide SpeechToText instance
        child: MultiBlocProvider(
          providers: [
            BlocProvider<OnBoardingBloc>(create: (context) => OnBoardingBloc(context.read<OnboardingRepository>()),)
          ],
          child: MaterialApp(
              title: 'Hamzahllc',
              theme: appTheme,
              home: const OnboardingView()
          ),
        ),
      ),
    );
  }
}
