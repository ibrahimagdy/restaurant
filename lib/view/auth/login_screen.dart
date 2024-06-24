import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/core/widgets/custom_button.dart';
import 'package:restaurant/core/widgets/custom_sign_in_button.dart';
import 'package:restaurant/core/widgets/custom_text_form_field.dart';
import 'package:restaurant/view/auth/sign_up_screen.dart';

import '../../core/utils/theme.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 40,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SvgPicture.asset("assets/icons/Logo.svg"),
              SizedBox(height: mediaQuery.height * 0.04),
              Text(
                'Welcome Back',
                textAlign: TextAlign.center,
                style: theme().textTheme.displaySmall,
              ),
              const SizedBox(height: 10),
              Text(
                'Hello, sign in to continue!',
                textAlign: TextAlign.center,
                style: theme().textTheme.titleSmall,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Or ',
                    textAlign: TextAlign.center,
                    style: theme().textTheme.titleSmall,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                    child: Text(
                      'Create new account',
                      textAlign: TextAlign.center,
                      style: theme().textTheme.titleSmall!.copyWith(
                            color: primaryColor,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.height * 0.04),
              CustomTextFormField(
                context: context,
                controller: emailController,
                hintText: 'Username or Email',
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                context: context,
                controller: passwordController,
                hintText: "Password",
                password: !isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
              SizedBox(height: mediaQuery.height * 0.025),
              const CustomButton(buttonText: 'Sign in'),
              SizedBox(height: mediaQuery.height * 0.025),
              Text(
                'Forgot Password?',
                textAlign: TextAlign.center,
                style:
                    theme().textTheme.titleSmall!.copyWith(color: primaryColor),
              ),
              SizedBox(height: mediaQuery.height * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: greyColor,
                      thickness: 1.5,
                      endIndent: 8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "OR",
                      style: TextStyle(
                        color: thirdColor,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: greyColor,
                      thickness: 1.5,
                      indent: 8,
                    ),
                  ),
                ],
              ),
              SizedBox(height: mediaQuery.height * 0.025),
              CustomSignInButton(
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.blue,
                ),
                text: 'Connect with Facebook',
                containerColor: const Color(0xff1877F2).withOpacity(0.05),
              ),
              const SizedBox(height: 10),
              CustomSignInButton(
                icon: SvgPicture.asset("assets/icons/Google.svg"),
                text: "Connect with Google",
                containerColor: greyColor.withOpacity(0.13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
