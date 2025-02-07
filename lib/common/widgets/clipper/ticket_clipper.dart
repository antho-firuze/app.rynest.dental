import 'package:flutter/material.dart';

class TicketClipper extends CustomClipper<Path> {
  TicketClipper({
    super.reclip,
    this.positionRatio = 0.25,
  });

  final double positionRatio;

  @override
  Path getClip(Size size) {
    assert(positionRatio >= 0.2 && positionRatio <= 0.7);
    double left = size.width * positionRatio - 10;
    double right = size.width * positionRatio + 10;

    return Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(left, 0.0)
      ..arcToPoint(
        Offset(left + 20, 0),
        clockwise: false,
        radius: const Radius.circular(4),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(right, size.height)
      ..arcToPoint(
        Offset(right - 20, size.height),
        clockwise: false,
        radius: const Radius.circular(4),
      )
      ..lineTo(0, size.height)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
