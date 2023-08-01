import 'package:carys/core/presentation/pages/tab_overlay_page.dart';
import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textfields.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/presentation/pages/create_account_page.dart';
import 'package:carys/features/auth/presentation/pages/reset_password_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      "Welcome back",
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
                AppTextfields.labelField(label: "Email Address"),
                SizedBox(height: 4.h),
                AppTextfields.labelField(label: "Password"),
                SizedBox(height: 4.h),
                AppButtons.primary(text: "Log in", onPressed: login),
                SizedBox(height: 3.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Forgotten password ?   ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGray),
                      ),
                      TextSpan(
                          text: "Click here",
                          style: AppTextstyle.subTitle(color: AppColors.purple),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              forgetPassword();
                            })
                    ],
                    style: AppTextstyle.subTitle(),
                  ),
                ),
                SizedBox(height: 3.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't have an account ?   ",
                        style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGray),
                      ),
                      TextSpan(
                          text: "Sign up here",
                          style: AppTextstyle.subTitle(color: AppColors.purple),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              signup();
                            })
                    ],
                    style: AppTextstyle.subTitle(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signup() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const CreateAccountPage()));
  }

  void login() {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => TabOverlayPage()));
  }

  void forgetPassword() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ResetPasswordPage()));
  }
}
