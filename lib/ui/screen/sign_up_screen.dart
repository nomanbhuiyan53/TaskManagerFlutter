import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasksystem/data/models/network_response.dart';
import 'package:tasksystem/data/network_caller/network_caller.dart';
import 'package:tasksystem/ui/utility/app_constants.dart';
import 'package:tasksystem/ui/utility/urls_list.dart';
import 'package:tasksystem/ui/widgets/backgroud_widget.dart';
import 'package:tasksystem/ui/widgets/snak_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool _showPassword = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroudWidget(
          child: SafeArea(
            child: Padding(
                    padding: const EdgeInsets.only(
                       top: 60,
                      left: 20,
                      right: 20,
                      bottom: 10
                    ),
                    child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String?value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter email';
                      }
                      if(AppConstants.emailRegExp.hasMatch(value) == false){
                        return 'Please enter valid email';
                      }
                        return null;
              
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Enter Email',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _firstNameController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter First Name';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Last Name';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Enter Phone Number',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone Number';
                      }
                      if(AppConstants.mobileRegExp.hasMatch(value) == false){
                        return 'Please enter valid Phone Number';
                      }
                        return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _showPassword == false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      suffixIcon: IconButton(onPressed: (){
                        _showPassword = !_showPassword;
                        if(mounted){
                          setState(() {});
                        }
                      }, icon: Icon( _showPassword ? Icons.remove_red_eye : Icons.visibility_off)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Visibility(
                    visible: _isLoading == false,
                    replacement: const Center(child: CircularProgressIndicator(),),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _registerUser();
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account?',
                        style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                              text: ' Sign In', style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
                    ),
                  ),
          )),
    );
  }
  void _onTapSignIn(){
    Navigator.pop(context);
  }

  void _registerUser() async {
    _isLoading = true;
    if(mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestInput = {
      "email":_emailController.text.trim(),
      "firstName":_firstNameController.text.trim(),
      "lastName":_lastNameController.text.trim(),
      "mobile":_phoneController.text.trim(),
      "password":_passwordController.text,
      "photo":""
    };

    NetworkResponse response = await NetworkCaller.postRequest(Urls.registrationUrl,requestInput);
    _isLoading = false;
    if(mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _clearTextFields();
      _isLoading = false;
      if(mounted) {
        showSnakMessage(context, 'Registration Successful');
      }

    } else {
      _isLoading = false;
      if(mounted) {
        showSnakMessage(context, 'Registration Failed', true);
      }

    }

  }

  void _clearTextFields() {
    _emailController.clear();
    _passwordController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _phoneController.clear();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
  }

}
