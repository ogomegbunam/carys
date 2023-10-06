import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/home/presentation/pages/date_filter_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenderSelectionTab extends StatefulWidget {
  const GenderSelectionTab({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final Function onBack;
  final Function onContinue;

  @override
  State<GenderSelectionTab> createState() => _GenderSelectionTabState();
}

class _GenderSelectionTabState extends State<GenderSelectionTab> {
  int selected = 0;

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
              "What's your gender",
              style: AppTextstyle.title(),
            ),
            const Spacer(flex: 6),
          ],
        ),
        Text(
          "Let's get to know you",
          style: AppTextstyle.bodySmall(),
        ),
        SizedBox(
          height: 10.h,
        ),
        _genderSelectTile("Male", 0),
        SizedBox(height: 4.h),
        _genderSelectTile('Female', 1),
        SizedBox(height: 5.h),
        AppButtons.primary(
          text: "Continue",
          onPressed: () {
            widget.onContinue();
          },
        ),
      ],
    );
  }

  Widget _genderSelectTile(String name, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: AppTextstyle.title().copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            AppRadioButton(selected: index == selected),
          ],
        ),
      ),
    );
  }
}
