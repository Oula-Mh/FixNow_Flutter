import 'dart:async';

import 'package:fixnow/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
      @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OnboardingView()),
            );
      });
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppTheme.primaryColor,
        body: Center(child: Image.asset("assets/images/Logo & Branding.png"),),
    );
  }
}