import 'dart:async';


import 'package:carys/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'core/presentation/widgets/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRightWithFade, child:const OnboardingPage() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Add your splash screen layout and customization here
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          'assets/images/loading_screen.png',
          width: double.maxFinite,
        ),
      ),
    );
  }
}
