// This is Link between events with states

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamztask/bloc/onboarding/onboarding_events.dart';
import 'package:hamztask/bloc/onboarding/onboarding_states.dart';
import '../../data/onboarding_repo/onboarding_repo_impl.dart';

class OnBoardingBloc extends Bloc<OnboardingEvents,OnboardingStates>{
  final OnboardingRepository repository;
  OnBoardingBloc(this.repository): super(OnboardingInital())
  {
    on<StartSpeechRecognition>((event, emit) async {
      emit(OnboardingSpeechLoading());
      try {
        await repository.startSpeechRecognition();
        emit(OnboardingSpeechSuccess());
      } catch (error) {
        emit(OnboardingSpeechError(error.toString()));
      }
    });
  }
}

