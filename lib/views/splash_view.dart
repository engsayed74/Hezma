import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hezma_app/views/animated_smooth_indicator.dart';
import 'package:hezma_app/views/vegtables_section.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    // الانتظار لمدة 3 ثواني ثم التنقل للشاشة التالية
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Image.asset('asset/images/لوجو-حزمه 4.png')),
      ),
    );
  }
}
