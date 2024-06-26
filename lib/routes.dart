import 'package:flutter/cupertino.dart';
import 'package:restaurant/view/auth/authentication/login_screen.dart';
import 'package:restaurant/view/auth/authentication/sign_up_screen.dart';
import 'package:restaurant/view/auth/forget_password/password_recovery_screen.dart';
import 'package:restaurant/view/auth/forget_password/reset_password_screen.dart';
import 'package:restaurant/view/auth/forget_password/verify_identity_screen.dart';
import 'package:restaurant/view/auth/location/current_location_screen.dart';
import 'package:restaurant/view/auth/location/enter_new_address_screen.dart';
import 'package:restaurant/view/auth/phone_number/phone_number_screen.dart';
import 'package:restaurant/view/home_layout/home_layout.dart';
import 'package:restaurant/view/home_screen/home_screen.dart';
import 'package:restaurant/view/onboarding_screens/onboarding_screens.dart';
import 'package:restaurant/view/ongoing_screen/ongoing_screen.dart';
import 'package:restaurant/view/profile_screen/profile_screen.dart';
import 'package:restaurant/view/splash_screen/intro_screen.dart';
import 'package:restaurant/view/splash_screen/splash_screen.dart';

import 'view/auth/phone_number/verify_phone_number_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  SplashScreen.id: (context) => const SplashScreen(),
  IntroScreen.id: (context) => const IntroScreen(),
  OnboardingScreens.id: (context) => const OnboardingScreens(),
  LoginScreen.id: (context) => const LoginScreen(),
  SignUpScreen.id: (context) => const SignUpScreen(),
  PhoneNumberScreen.id: (context) => const PhoneNumberScreen(),
  VerifyPhoneNumberScreen.id: (context) => const VerifyPhoneNumberScreen(),
  PasswordRecoveryScreen.id: (context) => const PasswordRecoveryScreen(),
  VerifyIdentityScreen.id: (context) => const VerifyIdentityScreen(),
  CurrentLocationScreen.id: (context) => const CurrentLocationScreen(),
  EnterNewAddressScreen.id: (context) => const EnterNewAddressScreen(),
  ResetPasswordScreen.id: (context) => const ResetPasswordScreen(),
  HomeLayout.id: (context) => const HomeLayout(),
  HomeScreen.id: (context) => const HomeScreen(),
  OngoingScreen.id: (context) => const OngoingScreen(),
  ProfileScreen.id: (context) => const ProfileScreen(),
};
