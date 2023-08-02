import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeactivateAccountPage extends StatelessWidget {
  const DeactivateAccountPage({super.key});

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
                    "Deactivate account",
                    style: AppTextstyle.title(),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Text(
                "We can't stand watching you go",
                style: AppTextstyle.bodySmall(),
              ),
              const Spacer(),
              Image.asset("assets/images/deactivate_image.png"),
              const Spacer(),
              AppButtons.primary(
                  text: "Confirm",
                  onPressed: () {
                    confirm(context);
                  }),
              SizedBox(height: 7.h),
            ],
          ),
        ),
      ),
    );
  }

  void confirm(BuildContext context) {}
}
