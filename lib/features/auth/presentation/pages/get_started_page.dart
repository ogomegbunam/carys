import 'package:carys/core/presentation/pages/tab_overlay_page.dart';
import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/presentation/pages/mobile_verification_page.dart';
import 'package:carys/features/auth/presentation/widgets/get_started_selection_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Text(
                "Ready to get started ?",
                style: AppTextstyle.title(),
              ),
              const Spacer(),
              Image.asset('assets/images/carys_logo.png', width: 70.w),
              const Spacer(),
              GetStartedSelectionButton(
                  text: "Continue with Facebook",
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  selected: selectedIndex == 0,
                  icon: 'facebook_icon'),
              SizedBox(height: 3.h),
              GetStartedSelectionButton(
                text: "Continue with Mobile number",
                onPressed: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                selected: selectedIndex == 1,
              ),
              const Spacer(flex: 2),
              AppButtons.primary(
                text: "Proceed",
                onPressed: proceed,
                enabled: selectedIndex != null,
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  void proceed() {
    if (selectedIndex == 0) {
      facebookLogin();
    } else {
      continueWithMobile();
    }
  }

  void facebookLogin() {
    // put implementation for facebook login
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TabOverlayPage()));
  }

  void continueWithMobile() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MobileVerificationPage()));
  }
}
