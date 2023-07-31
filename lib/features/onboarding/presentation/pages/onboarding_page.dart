import 'package:carys/core/presentation/pages/tab_overlay_page.dart';
import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/onboarding/presentation/widgets/onboarding_widget1.dart';
import 'package:carys/features/onboarding/presentation/widgets/onboarding_widget2.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController controller = PageController();
  ValueNotifier<int> pageIndex = ValueNotifier(0);

  List<Widget> onboardingScreens = const [
    OnboardingWidget1(),
    OnboardingWidget2(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            allowImplicitScrolling: false,
            onPageChanged: (index) {
              pageIndex.value = index;
            },
            children: onboardingScreens.map((e) => e).toList(),
          ),
          Align(
            alignment: const Alignment(0, 0.9),
            child: nextWidget(),
          ),
        ],
      ),
    );
  }

  Widget nextWidget() {
    return ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, index, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (index == 0)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Find Your Partner With Us",
                      style: AppTextstyle.title(),
                    ),
                    SizedBox(height: 2.w),
                    Text(
                      "Join us today to get started",
                      style: AppTextstyle.bodySmall(),
                    ),
                    SizedBox(height: 4.w),
                  ],
                ),
              SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 2,
                  effect: ExpandingDotsEffect(
                    expansionFactor: 4,
                    dotHeight: 3.w,
                    dotWidth: 3.w,
                    activeDotColor: AppColors.purple,
                    dotColor: AppColors.gray,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
              SizedBox(height: 6.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: AppButtons.primary(
                  text: index == 0 ? "Next" : "Get Started",
                  onPressed: next,
                  enabled: true,
                ),
              ),
              if (pageIndex.value == 0)
                TextButton(
                    onPressed: skip,
                    child: Text(
                      "Skip",
                      style: AppTextstyle.subTitle(color: AppColors.purple),
                    )),
            ],
          );
        });
  }

  void skip() {
    controller.animateToPage(onboardingScreens.length - 1,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  void next() {
    if (pageIndex.value == onboardingScreens.length - 1) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => TabOverlayPage()));
    } else {
      controller.animateToPage(pageIndex.value + 1,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }
}
