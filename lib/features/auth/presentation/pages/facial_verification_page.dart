import 'package:carys/core/presentation/pages/confirmation_page.dart';
import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/auth/presentation/pages/photos_and_privacy_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FacialVerificationPage extends StatefulWidget {
  const FacialVerificationPage({super.key});

  @override
  State<FacialVerificationPage> createState() => _FacialVerificationPageState();
}

class _FacialVerificationPageState extends State<FacialVerificationPage> {
  bool capturedImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Spacer(flex: 3),
                  Text(
                    "Facial verification",
                    style: AppTextstyle.title(),
                  ),
                  const Spacer(flex: 6),
                ],
              ),
              Text(
                "Let’s get to know you , this won’t take long",
                style: AppTextstyle.bodySmall(),
              ),
              SizedBox(
                height: 10.h,
              ),
              if (capturedImage) ...[
                Container(
                  width: 50.w,
                  height: 80.w,
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.gray,
                      width: 1.5.w,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.elliptical(50.w, 80.w),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ] else ...[
                InkWell(
                  onTap: takePicture,
                  child: Container(
                    padding: EdgeInsets.all(15.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.gray,
                        width: 1.5.w,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.gray,
                      size: 20.w,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                TextButton(
                    onPressed: takePicture,
                    child: Text(
                      "Tap to Take a picture",
                      style: AppTextstyle.bodyMedium(),
                    ))
              ],
              if (capturedImage)
                AppButtons.primary(text: "Continue", onPressed: submit),
            ],
          ),
        ),
      ),
    );
  }

  void takePicture() {
    setState(() {
      capturedImage = true;
    });
  }

  void submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(
          title: "Verification completed",
          subtitle: "let's move to the next step",
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PhotosAndPrivacyPage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
