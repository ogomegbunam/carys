import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/presentation/widgets/app_colors.dart';

class Filter extends StatefulWidget {
  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
        appBar: AppBar(
          title: Text(
            'Date filters',
            style: TextStyle(
                color: AppColors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              FontAwesomeIcons.arrowLeft,
              color: AppColors.black,
              size: 20,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: [],
        ));
  }
}
