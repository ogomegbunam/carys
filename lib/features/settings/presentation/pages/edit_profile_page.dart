import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Edit profile",
                    style: AppTextstyle.title(),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              GridView(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 5.w,
                  mainAxisSpacing: 5.w,
                ),
                children: [
                  profileImages(),
                  profileImages(),
                  profileImages(),
                  profileImages(),
                ],
              ),
              SizedBox(height: 5.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: AppButtons.primary(text: "Save", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container profileImages() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.gray,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Icon(
        Icons.camera_alt_outlined,
        color: AppColors.darkGray.withOpacity(0.3),
        size: 20.w,
      ),
    );
  }
}
