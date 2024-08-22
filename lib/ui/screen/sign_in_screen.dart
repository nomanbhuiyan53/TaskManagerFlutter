import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasksystem/ui/screen/forget_password_screen.dart';
import 'package:tasksystem/ui/screen/page/main_bottom_navigation.dart';
import 'package:tasksystem/ui/screen/sign_up_screen.dart';
import 'package:tasksystem/ui/widgets/backgroud_widget.dart';

import '../utility/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroudWidget(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get Started With',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                hintText: 'Enter Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter Password',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: _onTapNextScreen,
              child: const Icon(Icons.arrow_circle_right_outlined),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: TextButton(
                onPressed: _onTapForgetPassword,
                child: const Text(
                  'Forgot Password ?',
                ),
              ),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account ?",
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: ' Sign Up',
                      style: const TextStyle(color: AppColors.primaryColor),
                      recognizer: TapGestureRecognizer()
                        ..onTap = _onTapSignUpBtn,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  void _onTapNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const MainBottomNavigation(),
      ),
    );
  }

  void _onTapSignUpBtn() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
    );
  }

  void _onTapForgetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgetPasswordScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
