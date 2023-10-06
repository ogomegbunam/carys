import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfilePrivacyTab extends StatefulWidget {
  const ProfilePrivacyTab({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final Function onBack;
  final Function onContinue;

  @override
  State<ProfilePrivacyTab> createState() => _ProfilePrivacyTabState();
}

class _ProfilePrivacyTabState extends State<ProfilePrivacyTab> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  widget.onBack();
                },
                icon: const Icon(Icons.arrow_back)),
            const Spacer(flex: 3),
            Text(
              "Profile privacy",
              style: AppTextstyle.title(),
            ),
            const Spacer(flex: 6),
          ],
        ),
        Text(
          "Please set your profile visibility , charges may apply",
          style: AppTextstyle.bodySmall(),
        ),
        SizedBox(
          height: 10.h,
        ),
        _privacyOptionCard(
            0,
            'assets/svg/public_icon.svg',
            'Public profile',
            'Make my profile and information visible to anyone viewing my profile.',
            'Free'),
        SizedBox(height: 4.h),
        _privacyOptionCard(
            1,
            'assets/svg/private_star.svg',
            'Private profile',
            'Make my profile and information hiddden until i decide to make it public.',
            'Paid'),
        SizedBox(height: 5.h),
        AppButtons.primary(
            text: "Continue",
            onPressed: () {
              widget.onContinue();
            },
            enabled: selected != null),
      ],
    );
  }

  Widget _privacyOptionCard(
    int index,
    String icon,
    String title,
    String subtitle,
    String amount,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        width: double.maxFinite,
        height: 16.h,
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.w),
            border: index == selected
                ? Border.all(
                    color: AppColors.purple,
                    width: 2,
                  )
                : null,
            color: AppColors.lightGray),
        child: Row(
          children: [
            Container(
              width: 14.w,
              height: 14.w,
              alignment: Alignment.center,
              padding: EdgeInsets.all(2.5.w),
              decoration: BoxDecoration(
                color: AppColors.purple,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                icon,
                width: 10.w,
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 12.w,
                        height: 5.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                          color: AppColors.purple,
                        ),
                        child: Text(
                          amount,
                          style: AppTextstyle.bodySmall(color: AppColors.white)
                              .copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    title,
                    style: AppTextstyle.title().copyWith(
                      fontSize: 17.sp,
                    ),
                  ),
                  SizedBox(height: 1.w),
                  Text(
                    subtitle,
                    style: AppTextstyle.bodyMedium().copyWith(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 3.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
