import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 90.w,
      child: Column(
        children: [

        ],
      )
    );
  }
}
