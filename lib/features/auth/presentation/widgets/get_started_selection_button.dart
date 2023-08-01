import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GetStartedSelectionButton extends StatelessWidget {
  const GetStartedSelectionButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.selected,
    this.icon,
  });
  final String text;
  final Function onPressed;
  final bool selected;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          height: 14.w,
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.gray),
              borderRadius: BorderRadius.circular(3.w),
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.2),
                        offset: const Offset(2, 2),
                        blurRadius: 7,
                      )
                    ]
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Image.asset(
                  'assets/images/${icon!}.png',
                  width: 10.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 4.w),
              ],
              Text(
                text,
                style: TextStyle(
                  fontSize: 17.2.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
    );
  }
}
