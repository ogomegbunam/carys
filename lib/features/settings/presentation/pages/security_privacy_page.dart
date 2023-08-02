import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/settings/presentation/pages/change_password_page.dart';
import 'package:carys/features/settings/presentation/widgets/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SecurityPrivacyPage extends StatelessWidget {
  const SecurityPrivacyPage({super.key});

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
            SettingsListTile(
                text: "Change Password",
                icon: "password_icon",
                onPressed: () {
                  changePassword(context);
                }),
            SizedBox(height: 2.w),
          ],
        ),
      ),
    );
  }

  void changePassword(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ChangePasswordPage(),
      ),
    );
  }
}
