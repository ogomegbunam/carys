import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButtons {
  static Widget primary(
          {required String text,
          required Function onPressed,
          bool enabled = true}) =>
      _PrimayButton(text: text, onPressed: onPressed, enabled: enabled);

  static Widget secondary(
          {required String text,
          required Function onPressed,
          bool enabled = true}) =>
      _SecondaryButon(text: text, onPressed: onPressed, enabled: enabled);

  static Widget smallPrimary(
          {required String text,
          required Function onPressed,
          bool enabled = true}) =>
      _SmallPrimary(text: text, onPressed: onPressed, enabled: enabled);
}

class _PrimayButton extends StatelessWidget {
  const _PrimayButton({
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });
  final String text;
  final Function onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () {
              onPressed();
            }
          : null,
      child: Container(
        height: 14.w,
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.purple.withOpacity(enabled ? 1 : 0.5),
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}

class _SecondaryButon extends StatelessWidget {
  const _SecondaryButon({
    required this.text,
    required this.onPressed,
    this.enabled = true,
  });
  final String text;
  final Function onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () {
              onPressed();
            }
          : null,
      child: Container(
        height: 14.w,
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.gray,
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}

class _SmallPrimary extends StatelessWidget {
  const _SmallPrimary({
    required this.text,
    required this.onPressed,
    required this.enabled,
  });

  final String text;
  final Function onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () {
              onPressed();
            }
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.5.w),
        decoration: BoxDecoration(
          color: AppColors.purple.withOpacity(enabled ? 1 : 0.5),
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
