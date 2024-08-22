import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasksystem/ui/screen/sign_in_screen.dart';
import 'package:tasksystem/ui/utility/asset_path.dart';
import 'package:tasksystem/ui/widgets/backgroud_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if(mounted) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const SignInScreen()),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroudWidget(child: Center(
        child: SvgPicture.asset(AssetPath.logoSvg,width: 180,),
      )),
    );
  }
}
