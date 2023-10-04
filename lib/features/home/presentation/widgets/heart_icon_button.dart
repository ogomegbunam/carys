import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeartIconButton extends StatelessWidget {
  const HeartIconButton({
    super.key,
    this.onPressed,
  });

  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: const BoxDecoration(
          color: AppColors.purple,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset('assets/svg/heart_buble.svg'),
      ),
    );
  }
}
