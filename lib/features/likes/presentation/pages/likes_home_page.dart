import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/likes/presentation/widgets/like_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LikesHomePage extends StatelessWidget {
  const LikesHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          SizedBox(height: 2.w),
          Text(
            "Likes",
            style: AppTextstyle.title(),
          ),
          SizedBox(height: 1.w),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return const LikeListTile();
                }),
          ),
        ],
      ),
    );
  }
}
