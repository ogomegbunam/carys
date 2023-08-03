import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OnboardingWidget2 extends StatelessWidget {
  const OnboardingWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.w,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage('assets/images/Onboarding_5.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  AppColors.black.withOpacity(0.6), BlendMode.darken)),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 2.w),
              child: Row(
                children: [
                  Container(
                    width: 2.w,
                    height: 10.h,
                    color: AppColors.purple,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    "No more \nboring days, \nget coupled up !",
                    style: AppTextstyle.headline(
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
