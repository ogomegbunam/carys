import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_switch.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatDetailDrawer extends StatelessWidget {
  const ChatDetailDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 60.w),
      child: Container(
        color: AppColors.white,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 2.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Change Profile visibility",
                    style: AppTextstyle.subTitle(),
                  ),
                  AppSwitch(onChange: (val) {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
