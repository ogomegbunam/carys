import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final String icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: AppColors.lightGray),
          ),
        ),
        child: Row(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: AppColors.lightGray,
                ),
              ),
              child: SvgPicture.asset(
                'assets/svg/$icon.svg',
                width: 4.w,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              text,
              style:
                  AppTextstyle.subTitle().copyWith(fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.darkGray,
              size: 4.5.w,
            ),
          ],
        ),
      ),
    );
  }
}
