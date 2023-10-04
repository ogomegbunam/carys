import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/chat/presentation/pages/chat_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openChat(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.w),
        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 4.w),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border.symmetric(
            horizontal: BorderSide(color: AppColors.gray, width: 1),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 10.w,
              height: 10.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/user_profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Martha Ndukwe",
                  style: AppTextstyle.title()
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 1.w),
                Text(
                  "Are we still hanging out today ?",
                  style: AppTextstyle.bodySmall(),
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "8:23 pm",
                  style: AppTextstyle.bodySmall().copyWith(
                    color: AppColors.darkGray,
                  ),
                ),
                Container(
                  width: 4.w,
                  height: 4.w,
                  padding: EdgeInsets.all(0.5.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.purple,
                  ),
                  child: const FittedBox(
                    child: Text(
                      '2',
                      style: TextStyle(
                          color: AppColors.white, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void openChat(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ChatDetailPage();
    }));
  }
}
