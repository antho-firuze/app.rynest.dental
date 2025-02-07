import 'package:flutter/material.dart';

class HorizontalDashLinePaint extends CustomPainter {
  HorizontalDashLinePaint({
    super.repaint,
    this.color = Colors.grey,
    this.dashSize = 9,
    this.dashSpace = 5,
    this.positionRatio = 0,
  });

  final Color color;
  final double dashSize;
  final double dashSpace;
  final double positionRatio;

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    final position = size.height * positionRatio;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, position), Offset(startX + dashSize, position), paint);
      startX += dashSize + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
