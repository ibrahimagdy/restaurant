import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant/view/auth/authentication/login_screen.dart';
import 'package:restaurant/view/auth/phone_number/phone_number_screen.dart';

import '../../../constants.dart';
import '../../../core/utils/theme.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_sign_in_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'SignUpScreen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SvgPicture.asset("assets/icons/Logo.svg"),
                SizedBox(height: mediaQuery.height * 0.03),
                Text(
                  'Hello! Create Account',
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
                      'Already have an account? ',
                      textAlign: TextAlign.center,
                      style: theme().textTheme.titleSmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        'Sign in',
                        textAlign: TextAlign.center,
                        style: theme().textTheme.titleSmall!.copyWith(
                              color: primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mediaQuery.height * 0.02),
                CustomTextFormField(
                  context: context,
                  controller: nameController,
                  hintText: 'Your name',
                ),
                const SizedBox(height: 10),
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
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                ),
                SizedBox(height: mediaQuery.height * 0.025),
                CustomButton(
                  buttonText: 'Sign up',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, PhoneNumberScreen.id);
                    }
                  },
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
      ),
    );
  }
}
