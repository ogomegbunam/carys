import 'dart:math' as math;

import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:carys/features/chat/presentation/pages/video_call_page.dart';
import 'package:carys/features/chat/presentation/widgets/chat_bubble.dart';
import 'package:carys/features/chat/presentation/widgets/chat_detail_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: const ChatDetailDrawer(),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top + 9.h,
            color: AppColors.white,
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
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
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Martha Ndukwe",
                          style: AppTextstyle.bodyMedium()
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 1.w),
                        Text(
                          "Your profile is not visible to this person",
                          style: AppTextstyle.bodySmall().copyWith(
                            color: AppColors.darkGray,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 2.w),
                  GestureDetector(
                    onTap: videoCall,
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: SvgPicture.asset('assets/svg/video_call.svg'),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  GestureDetector(
                    onTap: openCloseDrawer,
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: const Icon(Icons.menu),
                    ),
                  ),
                  SizedBox(width: 2.w),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ChatBubble(
                      message: "Hello",
                      messageTime: DateTime.now(),
                      isRead: true,
                    ),
                    ChatBubble(
                      message: "Hello",
                      rightAlign: false,
                      messageTime: DateTime.now(),
                    ),
                    ChatBubble(
                      message:
                          "Some longer message that should definietly overflow this page",
                      messageTime: DateTime.now(),
                      isRead: true,
                    ),
                    ChatBubble(
                      message:
                          "Some longer message that should definietly overflow this page",
                      messageTime: DateTime.now(),
                      rightAlign: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 7.h,
            margin: EdgeInsets.fromLTRB(4.w, 1.w, 4.w, 4.w),
            padding: EdgeInsets.only(right: 2.w, left: 4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: AppColors.white,
              border: Border.all(
                color: AppColors.darkGray,
                width: 0.8,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: AppTextstyle.bodySmall(),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Your message here...'),
                  ),
                ),
                _iconButton('assets/svg/attach_file.svg', () {}),
                SizedBox(width: 2.w),
                _iconButton('assets/svg/photo_camera.svg', () {}),
                SizedBox(width: 2.w),
              ],
            ),
          )
        ],
      ),
    );
  }

  GestureDetector _iconButton(String icon, Function function) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Padding(
        padding: EdgeInsets.all(1.w),
        child: SvgPicture.asset(icon),
      ),
    );
  }

  void videoCall() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const VideoCallPage(),
      ),
    );
  }

  void openCloseDrawer() {
    if (scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.closeEndDrawer();
    } else {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }
}

class RecievedMessage extends StatelessWidget {
  const RecievedMessage({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(math.pi),
          child: CustomPaint(
            painter: CustomShape(AppColors.white),
          ),
        ),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        ),
      ],
    ));
  }
}

class SentMessage extends StatelessWidget {
  const SentMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        CustomPaint(painter: CustomShape(AppColors.purple)),
      ],
    ));
  }
}

class CustomShape extends CustomPainter {
  final Color bgColor;

  CustomShape(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(-5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
