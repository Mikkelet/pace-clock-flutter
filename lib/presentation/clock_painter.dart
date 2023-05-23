import 'package:flutter/cupertino.dart';

abstract class FourHandClockPainter extends CustomPainter {
  FourHandClockPainter();

  void rotate(Canvas canvas, double rotation) {
    canvas.rotate(rotation);
  }

  void rotateLine(Canvas canvas, Offset offset, double rotation) {
    canvas.translate(offset.dx, offset.dy);
    canvas.rotate(rotation);
    canvas.translate(-offset.dx, -offset.dy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
