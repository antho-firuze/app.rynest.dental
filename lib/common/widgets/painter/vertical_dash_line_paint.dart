import 'package:flutter/material.dart';

class VerticalDashLinePaint extends CustomPainter {
  VerticalDashLinePaint({
    super.repaint,
    this.color = Colors.black,
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
    double startY = 0;
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1;

    final position = size.width * positionRatio;

    while (startY < size.height) {
      canvas.drawLine(Offset(position, startY), Offset(position, startY + dashSize), paint);
      startY += dashSize + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
