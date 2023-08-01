import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onPressed});

  final String title;
  final String subtitle;
  final Function onPressed;

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
                    title,
                    style: AppTextstyle.title(),
                  ),
                  const Spacer(flex: 6),
                ],
              ),
              const Spacer(),
              Container(
                height: 35.w,
                width: 35.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.purple,
                      width: 4,
                    )),
                child: Icon(
                  Icons.check,
                  size: 15.w,
                  color: AppColors.purple,
                ),
              ),
              const Spacer(),
              Text(
                subtitle,
                style: AppTextstyle.bodySmall(),
              ),
              const Spacer(),
              AppButtons.primary(
                  text: "Continue",
                  onPressed: () {
                    onPressed();
                  }),
              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
    );
  }
}
