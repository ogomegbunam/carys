import 'package:carys/core/presentation/pages/tab_overlay_page.dart';
import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/data/models/country_codes.dart';
import 'package:carys/features/auth/presentation/pages/create_account_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MobileVerificationPage extends StatefulWidget {
  const MobileVerificationPage({super.key});

  @override
  State<MobileVerificationPage> createState() => _MobileVerificationPageState();
}

class _MobileVerificationPageState extends State<MobileVerificationPage> {
  CountryCodes countryCode = CountryCodes.all.first;

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
                "Continue with mobile number",
                style: AppTextstyle.title(),
              ),
              SizedBox(height: 1.2.h),
              Text(
                "Select country and provide mobile number",
                style: AppTextstyle.bodySmall(),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Container(
                    height: 13.w,
                    width: 16.w,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.gray),
                      borderRadius: BorderRadius.circular(2.w),
                    ),
                    child: DropdownButton<CountryCodes>(
                        underline: const SizedBox.shrink(),
                        items: CountryCodes.all
                            .map((cCode) => DropdownMenuItem<CountryCodes>(
                                value: countryCode,
                                child: Text(
                                  cCode.code,
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                )))
                            .toList(),
                        onChanged: (cCode) {
                          setState(() {
                            countryCode = cCode!;
                          });
                        }),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 4.w),
                        hintText: "Enter mobile number",
                        hintStyle: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.gray,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.gray),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.red),
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Spacer(flex: 2),
              AppButtons.primary(
                text: "Proceed",
                onPressed: proceed,
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  void proceed() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const CreateAccountPage()));
  }
}
