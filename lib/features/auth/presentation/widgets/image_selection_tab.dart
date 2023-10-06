import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ImageSelectionTab extends StatefulWidget {
  const ImageSelectionTab({
    super.key,
    required this.onBack,
    required this.onContinue,
  });

  final Function onBack;
  final Function onContinue;

  @override
  State<ImageSelectionTab> createState() => _ImageSelectionTabState();
}

class _ImageSelectionTabState extends State<ImageSelectionTab> {
  Set<int> images = {};

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
              "Add photos",
              style: AppTextstyle.title(),
            ),
            const Spacer(flex: 6),
          ],
        ),
        Text(
          "You can upload a maximum of 4 and minimum of 2",
          style: AppTextstyle.bodySmall(),
        ),
        SizedBox(
          height: 10.h,
        ),
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
            profileImages(1),
            profileImages(2),
            profileImages(3),
            profileImages(4),
          ],
        ),
        SizedBox(height: 5.h),
        AppButtons.primary(
            text: "Continue",
            onPressed: () {
              widget.onContinue();
            },
            enabled: images.length >= 4),
      ],
    );
  }

  Widget profileImages(int index) {
    bool haveImage = images.contains(index);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (haveImage) {
            images.remove(index);
          } else {
            images.add(index);
          }
        });
      },
      child: Container(
        alignment: haveImage ? Alignment.topRight : Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(4.w),
          image: haveImage
              ? const DecorationImage(
                  image: AssetImage('assets/images/user_profile.png'),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: haveImage
            ? InkWell(
                onTap: () {
                  setState(() {
                    images.remove(index);
                  });
                },
                child: Container(
                  width: 6.w,
                  height: 6.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.gray),
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    size: 5.w,
                  ),
                ),
              )
            : Icon(
                Icons.camera_alt_outlined,
                color: AppColors.darkGray.withOpacity(0.3),
                size: 10.w,
              ),
      ),
    );
  }
}
