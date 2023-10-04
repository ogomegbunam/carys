import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/features/home/presentation/widgets/heart_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DatesImageCard extends StatelessWidget {
  const DatesImageCard({super.key, required this.image, required this.private});
  final String image;
  final bool private;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.75,
      child: Container(
        alignment: Alignment.bottomLeft,
        margin: EdgeInsets.only(bottom: 2.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.w),
          image: DecorationImage(
            image: private
                ? const AssetImage('assets/images/private_account_image.png')
                : AssetImage(image),
            fit: private ? BoxFit.contain : BoxFit.cover,
          ),
          border: Border.all(color: AppColors.purple, width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: HeartIconButton(
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
