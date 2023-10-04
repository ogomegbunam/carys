import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({
    super.key,
    required this.onChange,
  });

  final Function(bool) onChange;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool selected = false;

  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          widget.onChange(selected);
        });
      },
      child: AnimatedContainer(
        width: 10.w,
        height: 4.2.w,
        duration: duration,
        curve: Curves.easeOut,
        alignment: selected ? Alignment.centerRight : Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkGray, width: 1),
          borderRadius: BorderRadius.circular(3.w),
          color: selected ? AppColors.purple : AppColors.white,
        ),
        child: Container(
          width: 3.w,
          height: 3.w,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              color: selected ? AppColors.white : AppColors.purple,
              shape: BoxShape.circle),
        ),
      ),
    );
  }
}
