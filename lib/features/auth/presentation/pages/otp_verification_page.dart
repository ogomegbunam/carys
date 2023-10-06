import 'package:carys/core/presentation/pages/confirmation_page.dart';
import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/presentation/pages/facial_verification_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  bool completed = false;
  String pin = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                    "OTP Verification",
                    style: AppTextstyle.title(),
                  ),
                  const Spacer(flex: 6),
                ],
              ),
              Text(
                "We sent a four digits code to your mail address",
                style: AppTextstyle.bodySmall(),
              ),
              const Spacer(),
              SizedBox(
                width: 280,
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: true,
                  autoFocus: true,
                  animationType: AnimationType.fade,
                  // validator: (val) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(2.w),
                    fieldHeight: 15.w,
                    fieldWidth: 15.w,
                    borderWidth: 1,
                    inactiveColor: AppColors.gray,
                    selectedColor: AppColors.gray,
                    activeColor: AppColors.gray,
                    inactiveFillColor: AppColors.white,
                    selectedFillColor: AppColors.white,
                    activeFillColor: AppColors.white,
                  ),
                  textStyle:
                      TextStyle(fontSize: 18.sp, color: AppColors.darkGray),
                  enableActiveFill: true,
                  cursorColor: AppColors.darkGray,
                  keyboardType: TextInputType.number,
                  onCompleted: (v) {
                    setState(() {
                      completed = true;
                      pin = v;
                      FocusManager.instance.primaryFocus?.unfocus();
                    });
                  },
                  // onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              const Spacer(),
              AppButtons.primary(
                  text: "Submit", onPressed: submit, enabled: completed),
              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
    );
  }

  void submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(
          title: "Account verification",
          subtitle: "Your account has been verified , tap to continue",
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FacialVerificationPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
