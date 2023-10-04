import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/settings/presentation/pages/deactivate_account_page.dart';
import 'package:carys/features/settings/presentation/pages/edit_profile_page.dart';
import 'package:carys/features/settings/presentation/pages/security_privacy_page.dart';
import 'package:carys/features/settings/presentation/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingsHomePage extends StatelessWidget {
  const SettingsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Settings",
                  style: AppTextstyle.title(),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.purple, width: 1),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Christian, 28",
                  style: AppTextstyle.bodySmall(),
                ),
                SizedBox(width: 1.w),
                SvgPicture.asset(
                  'assets/svg/verified_icon.svg',
                  width: 3.w,
                  colorFilter: const ColorFilter.mode(
                    AppColors.green,
                    BlendMode.dst,
                  ),
                )
              ],
            ),
            SizedBox(height: 2.h),
            AppButtons.smallPrimary(
                text: "Edit Profile",
                onPressed: () {
                  editProfile(context);
                }),
            SizedBox(height: 4.h),
            SettingsListTile(
                text: "Settings",
                icon: "settings",
                onPressed: () {
                  securityAndPrivacy(context);
                }),
            SizedBox(height: 2.w),
            SettingsListTile(
                text: "Security & Privacy",
                icon: "security_icon",
                onPressed: () {
                  securityAndPrivacy(context);
                }),
            SizedBox(height: 2.w),
            SettingsListTile(
                text: "Deactivate account",
                icon: "deactivate_account_icon",
                onPressed: () {
                  deactivateAccount(context);
                }),
            SizedBox(height: 2.w),
            SettingsListTile(
                text: "Log out",
                icon: "logout_icon",
                onPressed: () {
                  logout(context);
                }),
          ],
        ),
      ),
    );
  }

  void editProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditProfilePage(),
      ),
    );
  }

  void securityAndPrivacy(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SecurityPrivacyPage(),
      ),
    );
  }

  void deactivateAccount(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DeactivateAccountPage(),
      ),
    );
  }

  void logout(BuildContext context) {}
}
