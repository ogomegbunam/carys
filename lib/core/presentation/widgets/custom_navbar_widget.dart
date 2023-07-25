import 'package:carys/core/domain/entities/navbar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final List<NavbarIcon> items;
  final ValueChanged<int> onItemSelected;

  const CustomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.06),
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 7.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
              child: Material(
                color: Theme.of(context).colorScheme.background,
                child: InkResponse(
                  onTap: () => onItemSelected(index),
                  child:
                      BuildItem(item: item, isSelected: selectedIndex == index),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BuildItem extends StatelessWidget {
  const BuildItem({
    super.key,
    required this.item,
    required this.isSelected,
  });

  final NavbarIcon item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 4.h,
          height: 4.h,
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor : null,
            borderRadius: BorderRadius.circular(2.w),
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            "assets/svg/${item.icon}.svg",
            colorFilter: ColorFilter.mode(
              isSelected
                  ? Theme.of(context).colorScheme.background
                  : Theme.of(context).colorScheme.onSurface,
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
                color: isSelected
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.onSurface,
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
