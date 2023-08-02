import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textfields.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/presentation/pages/login_page.dart';
import 'package:carys/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
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
                      "Let's get you started",
                      style: AppTextstyle.title(),
                    ),
                    const Spacer(flex: 6),
                  ],
                ),
                Text(
                  "Provide neccessary details to create an account",
                  style: AppTextstyle.bodySmall(),
                ),
                SizedBox(height: 6.h),
                AppTextfields.labelField(label: "Fullname"),
                SizedBox(height: 4.h),
                AppTextfields.labelField(label: "Username"),
                SizedBox(height: 4.h),
                AppTextfields.labelField(label: "Email Address"),
                SizedBox(height: 4.h),
                AppTextfields.labelField(label: "Mobile Number"),
                SizedBox(height: 4.h),
                AppTextfields.labelField(label: "Password"),
                SizedBox(height: 6.h),
                AppButtons.primary(
                    text: "Create Account", onPressed: createAccount),
                SizedBox(height: 3.h),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Already have an account ?   ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkGray),
                  ),
                  TextSpan(
                      text: "Log in here",
                      style: AppTextstyle.subTitle(color: AppColors.purple),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          login();
                        })
                ], style: AppTextstyle.subTitle()))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  void createAccount() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OtpVerificationPage()));
  }
}
