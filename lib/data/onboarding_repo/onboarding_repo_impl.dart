import 'package:flutter/material.dart';
import 'package:hamztask/core/functions/navigtor.dart';
import 'package:hamztask/presentation/next_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

// here impl for onboarding functionality only here we need to impl Speech Recognition and handle permission
class OnboardingRepository {
  final SpeechToText speech;
  String lastRecognizedWord = '';

  OnboardingRepository({required this.speech});

  Future<void> startSpeechRecognition({BuildContext? context}) async {
    // Request microphone permission
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      // Microphone permission granted, proceed with speech recognition
      if (!speech.isListening) {
        bool available = await speech.initialize();
        if (available) {
          speech.listen(onResult: (result) {
            String recognizedWord = result.recognizedWords.toLowerCase();
            lastRecognizedWord = recognizedWord; // Store the last recognized word
            print('You said: $recognizedWord');
            if (recognizedWord == 'hello') {
              navigateAndEnd(context: context!, nextPage: const NextPage());
            } else {
              ScaffoldMessenger.of(context!).showSnackBar(const SnackBar(content: Text('Please Say Hello')));
            }
          });
        }
      }
    } else {
      throw Exception('Microphone permission not granted');
    }
  }
}