import 'package:carys/core/presentation/pages/confirmation_page.dart';
import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_textfields.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
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
                      "Create new password",
                      style: AppTextstyle.title(),
                    ),
                    const Spacer(flex: 6),
                  ],
                ),
                Text(
                  "let's get you up to speed",
                  style: AppTextstyle.bodySmall(),
                ),
                SizedBox(height: 6.h),
                AppTextfields.labelField(label: "Confirm Password"),
                SizedBox(height: 4.h),
                AppTextfields.labelField(label: "New Password"),
                SizedBox(height: 6.h),
                AppButtons.primary(text: "Submit", onPressed: submit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ConfirmationPage(
                  title: "New password created",
                  subtitle: "Password has been changed sucessfully !",
                  alignTop: false,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )));
  }
}
