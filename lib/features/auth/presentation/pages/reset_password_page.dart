import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_textfields.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/presentation/pages/create_new_password.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool wrongPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                    const Spacer(flex: 3),
                    Text(
                      "Reset password",
                      style: AppTextstyle.title(),
                    ),
                    const Spacer(flex: 6),
                  ],
                ),
                Text(
                  "We will send you a link to reset your password",
                  style: AppTextstyle.bodySmall(),
                ),
                SizedBox(height: 6.h),
                AppTextfields.labelField(label: "Email Address"),
                SizedBox(height: 4.h),
                AppButtons.primary(text: "Continue", onPressed: resetPassword),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void resetPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateNewPasswordPage(),
      ),
    );
  }
}
