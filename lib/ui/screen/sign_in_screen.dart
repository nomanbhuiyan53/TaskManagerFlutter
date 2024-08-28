import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasksystem/data/models/LoginModel.dart';
import 'package:tasksystem/data/models/UserModel.dart';
import 'package:tasksystem/data/models/network_response.dart';
import 'package:tasksystem/data/network_caller/network_caller.dart';
import 'package:tasksystem/ui/screen/forget_password_screen.dart';
import 'package:tasksystem/ui/screen/page/main_bottom_navigation.dart';
import 'package:tasksystem/ui/screen/sign_up_screen.dart';
import 'package:tasksystem/ui/utility/app_constants.dart';
import 'package:tasksystem/ui/utility/urls_list.dart';
import 'package:tasksystem/ui/widgets/backgroud_widget.dart';
import 'package:tasksystem/ui/widgets/snak_message.dart';

import '../controllers/auth_controller.dart';
import '../utility/app_colors.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroudWidget(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Form(
          key: _formKey,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Email';
                  }
                  if (AppConstants.emailRegExp.hasMatch(value) == false) {
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: _isPasswordVisible == false,
                decoration: InputDecoration(
                  hintText: 'Enter Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _isPasswordVisible = !_isPasswordVisible;
                      setState(() {});
                    },
                    icon: Icon(_isPasswordVisible
                        ? Icons.remove_red_eye
                        : Icons.visibility_off),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Visibility(
                visible: !_isLoading,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                  onPressed: _onTapNextScreen,
                  child: const Icon(Icons.arrow_circle_right_outlined),
                ),
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
        ),
      )),
    );
  }

  void _onTapNextScreen() {
    if (_formKey.currentState!.validate()) {
      _signIn();
    }
  }

  Future<void> _signIn() async {
    _isLoading = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> body = {
      'email': _emailController.text,
      'password': _passwordController.text
    };
    final NetworkResponse response =
        await NetworkCaller.postRequest(Urls.loginUrl, body);
    if (response.isSuccess) {
      LoginModel loginModel = LoginModel.fromJson(response.responseData);
      await AuthController.saveAccessToken(loginModel.token!);
      await AuthController.saveUser(loginModel.userModel!);

      if (mounted) {
        showSnakMessage(context, "Login Successful");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainBottomNavigation(),
          ),
        );
      }
    } else {
      if (mounted) {
        showSnakMessage(context, response.errorMessage ?? "Login Failed", true);
      }
    }
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
