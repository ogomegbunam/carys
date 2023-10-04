import 'package:carys/core/data/models/app_utils.dart';
import 'package:carys/core/presentation/blocs/tab_overlay/tab_overlay_bloc.dart';
import 'package:carys/features/chat/presentation/pages/chat_home_page.dart';
import 'package:carys/features/home/presentation/pages/home_page.dart';
import 'package:carys/features/likes/presentation/pages/likes_home_page.dart';
import 'package:carys/features/settings/presentation/pages/settings_home_page.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import 'package:carys/core/domain/entities/navbar_icon.dart';
import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomNavBarWidget extends StatefulWidget {
  const CustomNavBarWidget({
    super.key,
  });

  @override
  State<CustomNavBarWidget> createState() => _CustomNavBarWidgetState();
}

class _CustomNavBarWidgetState extends State<CustomNavBarWidget> {
  final List<NavbarIcon> items = [
    NavbarIcon("Home", 'home'),
    NavbarIcon("Likes", 'likes'),
    NavbarIcon("Chat", 'chat'),
    NavbarIcon("Settings", 'settings'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(
            color: AppColors.black.withOpacity(0.06),
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 7.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.mapIndexed((index, item) {
            int index = items.indexOf(item);
            return Flexible(
              child: Material(
                color: AppColors.white,
                child: InkResponse(
                  onTap: () {
                    onPressed(index);
                  },
                  child: BuildItem(item: item, index: index),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void onPressed(int index) async {
    Widget newPage;
    switch (index) {
      case 1:
        newPage = const LikesHomePage();
        break;
      case 2:
        newPage = const ChatHomePage();
      case 3:
        newPage = const SettingsHomePage();
      default:
        newPage = const HomePage();
    }

    int prevIndex = context.read<TabOverlayBloc>().state.tabIndex;
    context.read<TabOverlayBloc>().add(ChangeTabIndexEvent(index));
    await AppUtils.navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) {
      return newPage;
    }));
    // ignore: use_build_context_synchronously
    context.read<TabOverlayBloc>().add(ChangeTabIndexEvent(prevIndex));
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({
    super.key,
    required this.item,
    required this.index,
  });

  final NavbarIcon item;
  final int index;
  final Duration duration = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.read<TabOverlayBloc>().state.tabIndex == index;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        AnimatedContainer(
          duration: duration,
          width: 4.h,
          height: 4.h,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.purple : null,
            borderRadius: BorderRadius.circular(2.w),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/svg/${item.icon}.svg",
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.white : AppColors.darkGray,
              BlendMode.srcIn,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 0.3.h),
          child: Material(
            type: MaterialType.transparency,
            child: FittedBox(
                child: Text(
              item.title,
              style: TextStyle(
                color: isSelected ? AppColors.black : AppColors.darkGray,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                fontSize: 15.sp,
              ),
            )),
          ),
        ),
      ],
    );
  }
}
