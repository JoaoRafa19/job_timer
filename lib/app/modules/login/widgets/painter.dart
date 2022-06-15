import 'dart:math';

import 'package:flutter/material.dart';

class Painter extends CustomPainter {
  final double angle;
  final Image? image;
  final BuildContext? context;

  Painter({
    this.angle = 0,
    this.image,
    this.context,
  });

  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    final rotateAngle = 6000 * angle / 5;
    const origin = Offset(80, -145);
    Paint paint = Paint()
      ..strokeWidth = 4
      ..color = const Color(0xFF002946);

    canvas.drawLine(
        origin,
        origin.translate((origin.dx * cos(rotateAngle)) - cos(rotateAngle) * 30,
            (origin.dx * -sin(rotateAngle)) + sin(rotateAngle) * 30),
        paint);
    paint.color = const Color.fromARGB(255, 251, 255, 0);
    canvas.drawCircle(origin, 5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
