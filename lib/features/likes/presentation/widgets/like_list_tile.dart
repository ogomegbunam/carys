import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LikeListTile extends StatelessWidget {
  const LikeListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.w),
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 4.w),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.gray, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 10.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Martha Ndukwe likes your profile , tap to connect",
                style: AppTextstyle.bodySmall(),
              ),
              SizedBox(height: 1.w),
              Text(
                "8:20",
                style: AppTextstyle.bodySmall().copyWith(
                  color: AppColors.gray,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
