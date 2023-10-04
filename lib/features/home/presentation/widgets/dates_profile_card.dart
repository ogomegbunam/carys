import 'package:carys/core/presentation/widgets/app_chip.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/home/data/models/dates_model.dart';
import 'package:carys/features/home/presentation/widgets/dates_image_card.dart';
import 'package:carys/features/home/presentation/widgets/heart_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DatesProfileCard extends StatelessWidget {
  const DatesProfileCard({
    super.key,
    required this.date,
  });

  final DatesModel date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 3.h),
            AspectRatio(
              aspectRatio: 0.75,
              child: Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  image: DecorationImage(
                    image: date.private
                        ? const AssetImage(
                            'assets/images/private_account_image.png')
                        : AssetImage(date.images.first),
                    fit: date.private ? BoxFit.contain : BoxFit.cover,
                  ),
                  border: Border.all(color: AppColors.purple, width: 2),
                ),
                child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "${date.firstName}, ${date.age}",
                            style: AppTextstyle.title(color: AppColors.white),
                          ),
                          SizedBox(height: 1.5.h),
                          Row(
                            children: [
                              Icon(
                                Icons.work_outline,
                                color: AppColors.white,
                                size: 5.w,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                date.occupation,
                                style: AppTextstyle.bodySmall(
                                        color: AppColors.white)
                                    .copyWith(fontSize: 15.sp),
                              )
                            ],
                          ),
                          SizedBox(height: 1.5.w),
                          Row(
                            children: [
                              Icon(
                                Icons.school_outlined,
                                color: AppColors.white,
                                size: 5.w,
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                date.education,
                                style: AppTextstyle.bodySmall(
                                        color: AppColors.white)
                                    .copyWith(fontSize: 15.sp),
                              )
                            ],
                          )
                        ],
                      ),
                      HeartIconButton(
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(6.w),
              margin: EdgeInsets.only(bottom: 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: AppColors.lightGray),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "About",
                    style: AppTextstyle.subTitle(color: AppColors.darkGray),
                  ),
                  SizedBox(height: 2.w),
                  Text(
                    date.aboutMe,
                    style: AppTextstyle.bodySmall(),
                  ),
                  SizedBox(height: 6.w),
                  Text(
                    "Basics",
                    style: AppTextstyle.subTitle(color: AppColors.darkGray),
                  ),
                  SizedBox(height: 2.w),
                  Wrap(
                    spacing: 2.w,
                    runSpacing: 2.w,
                    children: date.basics
                        .map(
                          (uBasics) => AppChip(text: uBasics),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 6.w),
                  Text(
                    "My Interests",
                    style: AppTextstyle.subTitle(color: AppColors.darkGray),
                  ),
                  SizedBox(height: 2.w),
                  Wrap(
                    spacing: 2.w,
                    runSpacing: 2.w,
                    children: date.interest
                        .map(
                          (uInterest) => AppChip(text: uInterest),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            ...date.images.sublist(1).map(
                  (image) => DatesImageCard(
                    image: image,
                    private: date.private,
                  ),
                ),
            Container(
              padding: EdgeInsets.all(6.w),
              margin: EdgeInsets.only(bottom: 2.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                  color: AppColors.lightGray),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(0.5.w),
                          decoration: const BoxDecoration(
                            color: AppColors.purple,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: AppColors.white,
                            size: 4.w,
                          )),
                      SizedBox(width: 2.w),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${date.firstName}'s location"),
                          SizedBox(height: 2.w),
                          Text(date.location),
                          SizedBox(height: 2.w),
                          Text("${date.distance} km away"),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _iconButtonWidget(Icons.close, () {}),
                      _iconButtonWidget(Icons.check, () {}),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget _iconButtonWidget(IconData icon, Function function) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
          padding: EdgeInsets.all(4.w),
          decoration: const BoxDecoration(
            color: AppColors.purple,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.white,
            size: 8.w,
          )),
    );
  }
}
