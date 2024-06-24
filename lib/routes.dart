import 'package:flutter/cupertino.dart';
import 'package:restaurant/view/onboarding_screens/onboarding_screens.dart';
import 'package:restaurant/view/splash_screen/intro_screen.dart';
import 'package:restaurant/view/splash_screen/splash_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.id: (context) => const SplashScreen(),
  IntroScreen.id: (context) => const IntroScreen(),
  OnboardingScreens.id: (context) => const OnboardingScreens(),
};
