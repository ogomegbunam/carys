import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VideoCallPage extends StatelessWidget {
  const VideoCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: AppColors.black,
            )),
        backgroundColor: AppColors.white,
        title: Text(
          "Video Call",
          style: AppTextstyle.title(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 20.w,
            height: 20.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_profile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 4.w),
          Text("Martha Ndukwe", style: AppTextstyle.title()),
          SizedBox(height: 4.w),
          Text("Ringing", style: AppTextstyle.bodySmall()),
          SizedBox(height: 6.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _greenSmallButton('assets/svg/mic.svg', () {}),
              _redButton('assets/svg/phone.svg', () {}),
              _greenSmallButton('assets/svg/video_icon.svg', () {}),
            ],
          )
        ],
      ),
    );
  }

  Widget _greenSmallButton(String icon, Function function) {
    return Container(
      width: 10.w,
      height: 10.w,
      padding: EdgeInsets.all(2.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.green,
      ),
      child: SvgPicture.asset(icon),
    );
  }

  Widget _redButton(String icon, Function function) {
    return Container(
      width: 12.w,
      height: 12.w,
      padding: EdgeInsets.all(3.w),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.red,
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
