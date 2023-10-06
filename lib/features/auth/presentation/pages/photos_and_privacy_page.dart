import 'package:carys/core/presentation/pages/confirmation_page.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/features/auth/presentation/widgets/age_addition_tab.dart';
import 'package:carys/features/auth/presentation/widgets/gender_selection_tab.dart';
import 'package:carys/features/auth/presentation/widgets/image_selection_tab.dart';
import 'package:carys/features/auth/presentation/widgets/profile_information_tab.dart';
import 'package:carys/features/auth/presentation/widgets/profile_privacy_tab.dart';
import 'package:carys/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PhotosAndPrivacyPage extends StatefulWidget {
  const PhotosAndPrivacyPage({super.key});

  @override
  State<PhotosAndPrivacyPage> createState() => _PhotosAndPrivacyPageState();
}

class _PhotosAndPrivacyPageState extends State<PhotosAndPrivacyPage> {
  final Duration duration = const Duration(milliseconds: 500);

  int pageIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 2.h),
              Container(
                height: 1.5.w,
                alignment: Alignment.bottomLeft,
                width: double.maxFinite,
                color: AppColors.gray,
                child: AnimatedContainer(
                  duration: duration,
                  width: 17.w * (pageIndex + 1),
                  height: 1.5.w,
                  color: AppColors.purple,
                ),
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: pageViews,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void prevPage() {
    if (pageIndex >= 0) {
      pageIndex -= 1;
      controller.animateToPage(pageIndex,
          duration: duration, curve: Curves.easeIn);
    }
    setState(() {});
  }

  void nextPage() {
    if (pageIndex < (pageViews.length - 1)) {
      pageIndex += 1;
      controller.animateToPage(pageIndex,
          duration: duration, curve: Curves.easeIn);
      setState(() {});
    } else {
      submit();
    }
  }

  List<Widget> get pageViews {
    return [
      ImageSelectionTab(
        onBack: () {
          Navigator.pop(context);
        },
        onContinue: () {
          nextPage();
        },
      ),
      ProfilePrivacyTab(onBack: () {
        prevPage();
      }, onContinue: () {
        nextPage();
      }),
      GenderSelectionTab(onBack: () {
        prevPage();
      }, onContinue: () {
        nextPage();
      }),
      AgeAdditionTab(onBack: () {
        prevPage();
      }, onContinue: () {
        nextPage();
      }),
      ProfileInformationTab(onBack: () {
        prevPage();
      }, onContinue: () {
        nextPage();
      })
    ];
  }

  void submit() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmationPage(
          title: "You are all set !",
          subtitle: "Now you can starting shooting your shot",
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
    );
  }
}
