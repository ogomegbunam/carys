import 'package:carys/core/presentation/widgets/app_colors.dart';
import 'package:carys/core/presentation/widgets/app_textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
    required this.messageTime,
    this.borderRadius = 10,
    this.rightAlign = true,
    this.isRead = false,
  });

  final double borderRadius;
  final bool rightAlign;
  final String message;
  final bool isRead;
  final DateTime messageTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          rightAlign ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 80.w),
              child: CustomPaint(
                painter: rightAlign
                    ? RightBubble(
                        strokeColor: AppColors.purple,
                        strokeWidth: 10,
                        cornerRadius: borderRadius,
                        arrowHeight: 10,
                        arrowWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                      )
                    : LeftBubble(
                        strokeColor: AppColors.white,
                        strokeWidth: 10,
                        cornerRadius: borderRadius,
                        arrowHeight: 10,
                        arrowWidth: 10,
                        paintingStyle: PaintingStyle.fill,
                      ),
                child: _innerContainer(),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 4.w),
                Text(
                  DateFormat('hh:mm a').format(messageTime).toLowerCase(),
                  style: AppTextstyle.bodySmall().copyWith(),
                ),
                if (rightAlign && isRead)
                  SvgPicture.asset(
                    'assets/svg/double_check.svg',
                    width: 4.w,
                  )
              ],
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ],
    );
  }

  Container _innerContainer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.w),
      child: Text(
        message,
        style: AppTextstyle.bodyMedium(
          color: rightAlign ? AppColors.white : AppColors.darkGray,
        ).copyWith(
          fontSize: 15.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class RightBubble extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final double cornerRadius;
  final double arrowHeight;
  final double arrowWidth;

  RightBubble({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
    this.cornerRadius = 20,
    this.arrowHeight = 20,
    this.arrowWidth = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    double hSpace = arrowWidth;
    double vSpace = arrowHeight;
    double rad = cornerRadius;

    return Path()
      ..moveTo(rad, 0) // start top left
      ..lineTo(x - rad, 0) // before corner
      ..quadraticBezierTo(x, 0, x, rad) // top right radius
      ..lineTo(x, y - rad) // bottom right
      ..quadraticBezierTo(x, y, x - rad, y) //bottom right radius
      ..lineTo(x - (rad + hSpace / 2), y + vSpace)
      ..lineTo(x - (rad + hSpace), y)
      ..lineTo(rad, y)
      ..quadraticBezierTo(0, y, 0, y - rad) // bottom left radius
      ..lineTo(0, rad) // top left
      ..quadraticBezierTo(0, 0, rad, 0); // top left radius
  }

  @override
  bool shouldRepaint(RightBubble oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}

class LeftBubble extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final double cornerRadius;
  final double arrowHeight;
  final double arrowWidth;

  LeftBubble({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
    this.cornerRadius = 20,
    this.arrowHeight = 20,
    this.arrowWidth = 20,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    double hSpace = arrowWidth;
    double vSpace = arrowHeight;
    double rad = cornerRadius;

    return Path()
      ..moveTo(rad, 0) // start top left
      ..lineTo(rad + hSpace / 2, -vSpace)
      ..lineTo(rad + hSpace, 0)
      ..lineTo(x - rad, 0) // before corner
      ..quadraticBezierTo(x, 0, x, rad) // top right radius
      ..lineTo(x, y - rad) // bottom right
      ..quadraticBezierTo(x, y, x - rad, y) //bottom right radius
      ..lineTo(rad, y)
      ..quadraticBezierTo(0, y, 0, y - rad) // bottom left radius
      ..lineTo(0, rad) // top left
      ..quadraticBezierTo(0, 0, rad, 0); // top left radius
  }

  @override
  bool shouldRepaint(LeftBubble oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
