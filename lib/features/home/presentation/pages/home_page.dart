import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/features/home/presentation/pages/filter.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover',style: TextStyle(
          color: AppColors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          
          GestureDetector(
            onTap: (){
              Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.leftToRightWithFade, child: Filter() ));
 
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                    'assets/svg/filter_icon.svg',
                    height: 6.w,
                    width: 6.w,
                  ),
            ),
          ),
             // SizedBox(width: 2.w,)
        ],
      ),
      body: SafeArea(child: Text("Homepage")),
    );
  }
}
