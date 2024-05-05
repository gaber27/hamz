import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamztask/bloc/nyt/nyt_bloc.dart';
import 'package:hamztask/bloc/onboarding/onboarding_bloc.dart';
import 'package:hamztask/core/network/dio.dart';
import 'package:hamztask/core/theme.dart';
import 'package:hamztask/data/nyt_repo/nyt_repo_impl.dart';
import 'package:hamztask/data/onboarding_repo/onboarding_repo_impl.dart';
import 'package:hamztask/presentation/onboarding/onboarding_view.dart';
import 'package:sizer/sizer.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'bloc/connectivity/connectivity_bloc.dart';
import 'core/network/local.dart'; // Import SpeechToText

void main() async{
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CachHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiRepositoryProvider(
        providers: [
          RepositoryProvider<OnboardingRepository>(
            create: (context) => OnboardingRepository(speech: SpeechToText()),
          ),
          RepositoryProvider<NYTRepository>(
            create: (context) => NYTRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<OnBoardingBloc>(
              create: (context) => OnBoardingBloc(context.read<OnboardingRepository>()),
            ),
            BlocProvider<NYTBloc>(
              create: (context)=> NYTBloc(context.read<NYTRepository>())
            ),
            BlocProvider(
              create: (context) => ConnectivityBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'Hamzahllc',
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            home: const OnboardingView(),
          ),
        ),
      ),
    );
  }
}

/// HTTP Function To Use Internet In App
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext ? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}