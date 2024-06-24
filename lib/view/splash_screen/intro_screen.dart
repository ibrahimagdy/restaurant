import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/view/onboarding_screens/onboarding_screens.dart';

class IntroScreen extends StatelessWidget {
  static const String id = 'IntroScreen';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/intro.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 6),
              Row(
                children: [
                  Text(
                    'Find and Get\nYour Best Food',
                    style: theme().textTheme.displayLarge,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Find the most delicious food\nwith the best quality and free delivery here',
                    style: theme().textTheme.titleMedium,
                  ),
                ],
              ),
              const Spacer(flex: 1),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, OnboardingScreens.id);
                },
                child: SvgPicture.asset("assets/icons/next_button.svg"),
              ),
              const SizedBox(height: 30),
              Text(
                'Skip',
                style: theme().textTheme.titleMedium!.copyWith(
                      color: Colors.white.withOpacity(0.5),
                    ),
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
