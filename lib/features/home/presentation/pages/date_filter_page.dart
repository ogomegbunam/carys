import 'package:carys/core/presentation/widgets/app_buttons.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_switch.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/home/data/models/dates_filter_model.dart';
import 'package:carys/features/home/presentation/bloc/dates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DateFilterPage extends StatefulWidget {
  const DateFilterPage({super.key});

  @override
  State<DateFilterPage> createState() => _DateFilterPageState();
}

class _DateFilterPageState extends State<DateFilterPage> {
  late int minSliderRange;
  late int maxSliderRange;
  late int distanceSlider;
  late bool hideProfile;
  late bool verifiedAcounts;
  @override
  void initState() {
    DatesFilterModel filterModel = DatesFilterModel.initial();
    minSliderRange = filterModel.minAge;
    maxSliderRange = filterModel.maxAge;
    distanceSlider = filterModel.distance;
    hideProfile = filterModel.hidePrivateProfile;
    verifiedAcounts = filterModel.showVerifiedAccount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(child: BlocBuilder<DatesBloc, DatesState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                SizedBox(height: 2.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Date filters",
                              style: AppTextstyle.headline()
                                  .copyWith(fontSize: 18.sp),
                            ),
                            SizedBox(height: 2.w),
                            Text(
                              "Customize your swipe options",
                              style: AppTextstyle.subTitle()
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.w),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h),
                        Text(
                          "Age",
                          style:
                              AppTextstyle.bodySmall(color: AppColors.darkGray),
                        ),
                        SizedBox(height: 2.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray, width: 2),
                            borderRadius: BorderRadius.circular(3.w),
                            color: AppColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Between ${DatesFilterModel.minSelectAge} and ${DatesFilterModel.maxSelectAge}",
                                style: AppTextstyle.bodySmall(),
                              ),
                              SizedBox(height: 5.w),
                              Padding(
                                padding: EdgeInsets.only(left: 3.w),
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    rangeThumbShape: RoundRangeSliderThumbShape(
                                        enabledThumbRadius: 3.w),
                                    overlayShape: SliderComponentShape.noThumb,
                                    trackHeight: 1.w,
                                    rangeTrackShape:
                                        const RoundedRectRangeSliderTrackShape(),
                                  ),
                                  child: RangeSlider(
                                      activeColor: AppColors.purple,
                                      inactiveColor: AppColors.lightGray,
                                      min: DatesFilterModel.minSelectAge
                                          .toDouble(),
                                      max: DatesFilterModel.maxSelectAge
                                          .toDouble(),
                                      values: RangeValues(
                                        minSliderRange.toDouble(),
                                        maxSliderRange.toDouble(),
                                      ),
                                      onChanged: (newValues) {
                                        setState(() {
                                          minSliderRange =
                                              newValues.start.toInt();
                                          maxSliderRange =
                                              newValues.end.toInt();
                                        });
                                        // cntr.updateMinSliderPrice(newValues.start.round());
                                        // cntr.updateMaxSliderPrice(newValues.end.round());
                                      }),
                                ),
                              ),
                              SizedBox(height: 5.w),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Show people 2 years either side if i run out",
                                    style: AppTextstyle.bodySmall(
                                        color: AppColors.darkGray),
                                  ),
                                  AppSwitch(
                                    onChange: (value) {},
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Show verified accounts ",
                          style:
                              AppTextstyle.bodySmall(color: AppColors.darkGray),
                        ),
                        SizedBox(height: 2.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.w, horizontal: 4.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray, width: 2),
                            borderRadius: BorderRadius.circular(3.w),
                            color: AppColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _radioTile("Yes", verifiedAcounts, () {
                                verifiedAcounts = true;
                              }),
                              SizedBox(height: 2.h),
                              _radioTile("No", !verifiedAcounts, () {
                                verifiedAcounts = false;
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Distance",
                          style:
                              AppTextstyle.bodySmall(color: AppColors.darkGray),
                        ),
                        SizedBox(height: 2.w),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 2.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray, width: 2),
                            borderRadius: BorderRadius.circular(3.w),
                            color: AppColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Text(
                                  "Whole Country",
                                  style: AppTextstyle.bodySmall(),
                                ),
                              ),
                              SizedBox(height: 5.w),
                              SliderTheme(
                                data: SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 3.w),
                                  overlayShape: SliderComponentShape.noThumb,
                                  trackHeight: 1.w,
                                ),
                                child: Slider(
                                    min: 0,
                                    max:
                                        DatesFilterModel.maxDistance.toDouble(),
                                    activeColor: AppColors.purple,
                                    inactiveColor: AppColors.lightGray,
                                    value: distanceSlider.toDouble(),
                                    onChanged: (value) {
                                      setState(() {
                                        distanceSlider = value.toInt();
                                      });
                                    }),
                              ),
                              SizedBox(height: 5.w),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Show people slightly further away if i run out",
                                      style: AppTextstyle.bodySmall(
                                          color: AppColors.darkGray),
                                    ),
                                    AppSwitch(
                                      onChange: (value) {},
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          "Hide private profiles ",
                          style:
                              AppTextstyle.bodySmall(color: AppColors.darkGray),
                        ),
                        SizedBox(height: 2.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.w, horizontal: 4.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.gray, width: 2),
                            borderRadius: BorderRadius.circular(3.w),
                            color: AppColors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _radioTile("Yes", hideProfile, () {
                                hideProfile = true;
                              }),
                              SizedBox(height: 2.h),
                              _radioTile("No", !hideProfile, () {
                                hideProfile = false;
                              }),
                            ],
                          ),
                        ),
                        SizedBox(height: 2.h),
                        AppButtons.primary(text: "Apply", onPressed: () {}),
                        SizedBox(height: 2.w),
                        AppButtons.secondary(text: "Reset", onPressed: () {}),
                        SizedBox(height: 2.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _radioTile(String text, bool selected, Function function) {
    return GestureDetector(
      onTap: () {
        setState(() {
          function();
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextstyle.title(color: AppColors.darkGray)
                .copyWith(fontSize: 17.sp),
          ),
          AppRadioButton(selected: selected),
        ],
      ),
    );
  }
}

class AppRadioButton extends StatelessWidget {
  const AppRadioButton({
    super.key,
    required this.selected,
  });
  final bool selected;

  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.w,
      width: 7.w,
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.darkGray, width: 1),
      ),
      child: AnimatedContainer(
        duration: duration,
        curve: Curves.bounceOut,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.darkGray, width: 1),
          shape: BoxShape.circle,
          color: selected ? AppColors.purple : null,
        ),
      ),
    );
  }
}
