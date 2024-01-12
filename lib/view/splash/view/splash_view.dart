import 'package:flutter/material.dart';
import 'package:vibration_appp/core/constant/app/color_constant.dart';
import 'package:vibration_appp/core/constant/app/lottie_constant.dart';
import 'package:vibration_appp/view/login/login_page.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1700),() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const LoginPage()));
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.instance.primary,
      body: Center(
        child: Container(
          child: LottiePathEnum.splash.toWidgetLottie,
        ),
      ),
    );
  }
}
