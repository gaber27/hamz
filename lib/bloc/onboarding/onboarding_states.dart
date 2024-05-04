// states for onboarding for all functions
abstract class OnboardingStates{}

class OnboardingInital extends OnboardingStates{}

class OnboardingSpeechLoading extends OnboardingStates{}

class OnboardingSpeechSuccess extends OnboardingStates{}

class OnboardingSpeechError extends OnboardingStates {
  final String message;
  OnboardingSpeechError(this.message);
}
