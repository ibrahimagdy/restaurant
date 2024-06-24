import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/utils/theme.dart';
import 'package:restaurant/core/widgets/custom_button.dart';

import '../auth/login_screen.dart';
import 'onboarding_content.dart';

class OnboardingScreens extends StatefulWidget {
  static const String id = 'OnboardingScreens';

  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnboardingScreens> {
  int currentIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 6),
                      Image.asset(
                        contents[i].image,
                        height: 300,
                      ),
                      const Spacer(flex: 2),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: theme().textTheme.displaySmall,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].desc,
                        textAlign: TextAlign.center,
                        style: theme().textTheme.titleSmall,
                      ),
                      const Spacer(flex: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                      const Spacer(flex: 2),
                      CustomButton(
                        buttonText: 'Get Started',
                        onTap: () {
                          if (currentIndex == contents.length - 1) {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                          }
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear,
                          );
                        },
                      ),
                      const Spacer(flex: 2),
                    ],
                  ),
                );
              },
            ),
          ),
          // "Get Started" button
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: currentIndex == index ? 35 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? primaryColor : secondGreyColor,
      ),
    );
  }
}
