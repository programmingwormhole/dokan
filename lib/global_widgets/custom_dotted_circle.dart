import 'dart:math';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomDottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primary.withOpacity(.4)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double radius = min(size.width / 2, size.height / 2);

    final Path path = Path();
    for (double i = 0; i < 360; i += 10) {
      final double x1 = size.width / 2 + radius * cos(degreesToRadians(i));
      final double y1 = size.height / 2 + radius * sin(degreesToRadians(i));
      final double x2 = size.width / 2 + radius * cos(degreesToRadians(i + 5));
      final double y2 = size.height / 2 + radius * sin(degreesToRadians(i + 5));
      path.moveTo(x1, y1);
      path.lineTo(x2, y2);
    }

    canvas.drawPath(path, paint);
  }

  double degreesToRadians(double degrees) => degrees * pi / 180;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
