


import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/presentation/widgets/app_colors.dart';

class ChipTile extends StatelessWidget {
  final String text;
  final bool selected;
  final Function onPressed;
  const ChipTile(
      {super.key,
      required this.text,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InputChip(
      showCheckmark: false,
      onSelected: (value) {
        onPressed();
      },
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: Text(text,),
      selected: selected,
      selectedColor: Colors.white,
      backgroundColor: Colors.black,
      shape: StadiumBorder(
        side: BorderSide(color: AppColors.white, width: 0.05.w),
      ),
    );
  }
}