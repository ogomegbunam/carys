import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppTextstyle {
  static TextStyle headline({Color color = AppColors.black}) => TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle title({Color color = AppColors.black}) => TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle subTitle({Color color = AppColors.black}) => TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: color,
      );

  static TextStyle bodySmall({Color color = AppColors.black}) => TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: color,
      );
}
