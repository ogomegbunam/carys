import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.text,
    this.selected = true,
  });

  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.w),
      decoration: BoxDecoration(
        border: selected
            ? null
            : Border.all(color: AppColors.darkGray.withOpacity(0.3)),
        color: selected ? AppColors.purple : AppColors.gray,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: selected ? AppColors.white : AppColors.darkGray,
        ),
      ),
    );
  }
}
