import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/home/presentation/pages/date_filter_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AgeAdditionTab extends StatefulWidget {
  const AgeAdditionTab({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final Function onBack;
  final Function onContinue;

  @override
  State<AgeAdditionTab> createState() => _AgeAdditionTabState();
}

class _AgeAdditionTabState extends State<AgeAdditionTab> {
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
              "What’s your age ?",
              style: AppTextstyle.title(),
            ),
            const Spacer(flex: 6),
          ],
        ),
        Text(
          "Let's get to know you",
          style: AppTextstyle.bodySmall(),
        ),
        SizedBox(height: 8.h),
        Container(
          width: 60.w,
          height: 12.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.w),
            color: AppColors.lightGray,
          ),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'YY/MM/DD',
            ),
          ),
        ),
        SizedBox(height: 10.h),
        AppButtons.primary(
          text: "Next",
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
