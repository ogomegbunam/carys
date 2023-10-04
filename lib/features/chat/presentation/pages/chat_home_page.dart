import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/chat/presentation/widgets/chat_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatHomePage extends StatelessWidget {
  const ChatHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          SizedBox(height: 2.w),
          Text(
            "Chat",
            style: AppTextstyle.title(),
          ),
          SizedBox(height: 4.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 75.w,
                height: 10.w,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: AppColors.darkGray,
                    ),
                    SizedBox(width: 2.w),
                    Text(
                      "Search message",
                      style: AppTextstyle.bodySmall(),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 3.w),
              Container(
                alignment: Alignment.center,
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: AppColors.darkGray,
                ),
              ),
            ],
          ),
          SizedBox(height: 1.w),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return const ChatListTile();
                }),
          ),
        ],
      ),
    );
  }
}
