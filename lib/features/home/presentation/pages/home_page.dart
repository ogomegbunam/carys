import 'package:carys/core/presentation/blocs/tab_overlay/tab_overlay_bloc.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/home/data/models/dates_filter_model.dart';
import 'package:carys/features/home/data/models/dates_model.dart';
import 'package:carys/features/home/presentation/bloc/dates_bloc.dart';
import 'package:carys/features/home/presentation/pages/date_filter_page.dart';
import 'package:carys/features/home/presentation/widgets/dates_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    if (context.read<DatesBloc>().state is DatesInitial) {
      context.read<DatesBloc>().add(GetDatesEvent());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<TabOverlayBloc>().add(ShowNavTabEvent());

    return Scaffold(
      body: BlocBuilder<DatesBloc, DatesState>(
        builder: (context, state) {
          if (state is DatesLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.purple,
              ),
            );
          } else if (state is DatesSuccess) {
            List<DatesModel> allDates = filterDates(state.dates, state.filter);
            return Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                SizedBox(height: 2.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Discover",
                              style: AppTextstyle.headline()
                                  .copyWith(fontSize: 18.sp),
                            ),
                            SizedBox(height: 2.w),
                            Text(
                              "Find nearby accounts within your location",
                              style: AppTextstyle.subTitle()
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                          onTap: goToFilterPage,
                          child: Icon(Icons.tune, size: 7.w)),
                    ],
                  ),
                ),
                SizedBox(height: 1.w),
                Expanded(
                  child: allDates.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "No Account",
                              style: AppTextstyle.title(),
                            ),
                            Text(
                              "Change your filter settings or your profile settings to allow more users",
                              style: AppTextstyle.bodySmall(),
                            ),
                          ],
                        )
                      : PageView.builder(
                          itemCount: allDates.length,
                          itemBuilder: (context, index) {
                            DatesModel date = allDates[index];
                            return DatesProfileCard(date: date);
                          },
                        ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text(
                "Something Went Wrong",
                style: AppTextstyle.title(),
              ),
            );
          }
        },
      ),
    );
  }

  void goToFilterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DateFilterPage(),
      ),
    );
  }

  List<DatesModel> filterDates(
      List<DatesModel> dates, DatesFilterModel filter) {
    List<DatesModel> filtered = dates.where((DatesModel dates) {
      bool ageFilter = dates.age >= filter.minAge && dates.age <= filter.maxAge;
      bool hidePrivateFilter = dates.private;
      bool distanceFilter = dates.distance <= filter.distance;
      if (filter.showMoreAge) {
        ageFilter = true;
      }
      if (filter.showMoreDistance) {
        distanceFilter = true;
      }

      return (ageFilter && hidePrivateFilter && distanceFilter);
    }).toList();
    return dates;
  }
}
