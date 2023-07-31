import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButtons {
  static Widget primary(
          {required String text,
          required Function onPressed,
          bool enabled = true}) =>
      _PrimayButton(text: text, onPressed: onPressed, enabled: enabled);
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
          color: Theme.of(context).primaryColor.withOpacity(enabled ? 1 : 0.5),
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
