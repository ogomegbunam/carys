import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_chip.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/data/models/profileInfo.dart';
import 'package:carys/features/home/presentation/pages/date_filter_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileInformationTab extends StatefulWidget {
  const ProfileInformationTab({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final Function onBack;
  final Function onContinue;

  @override
  State<ProfileInformationTab> createState() => _ProfileInformationTabState();
}

class _ProfileInformationTabState extends State<ProfileInformationTab> {
  int selected = 0;
  Set<String> chosen = {};

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
              "Profile information",
              style: AppTextstyle.title(),
            ),
            const Spacer(flex: 6),
          ],
        ),
        Text(
          "Let's get to know you",
          style: AppTextstyle.bodySmall(),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  ProfileInformation.test().userInfo.entries.map<Widget>((qa) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      qa.key,
                      style: TextStyle(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.purple,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Wrap(
                      runSpacing: 2.w,
                      spacing: 2.w,
                      children: [
                        ...qa.value.map(
                          (ans) => AppChip(
                            text: ans,
                            selected: chosen.contains('$qa-$ans'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.w),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        AppButtons.primary(
          text: "Next",
          onPressed: () {
            widget.onContinue();
          },
        ),
      ],
    );
  }
}
