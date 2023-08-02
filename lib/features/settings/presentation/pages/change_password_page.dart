import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_textfields.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/settings/presentation/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Change password",
                    style: AppTextstyle.title(),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Text(
                "You can update your password here",
                style: AppTextstyle.bodySmall(),
              ),
              SizedBox(height: 5.h),
              AppTextfields.labelField(label: "New Password"),
              SizedBox(height: 5.h),
              AppTextfields.labelField(label: "Confirm Password"),
              SizedBox(height: 7.h),
              AppButtons.primary(text: "Submit", onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }

  void changePassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
      ),
    );
  }
}
