import 'dart:math';

import 'package:flutter/material.dart';

class ClockIntervalsView extends StatelessWidget {
  final double circ;

  const ClockIntervalsView(this.circ, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: IntervalsPainter(circ),
    );
  }
}

class IntervalsPainter extends CustomPainter {
  final double circ;

  IntervalsPainter(this.circ);

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 60; i++) {
      const fraction = 1 / 60;
      const x = (2 * pi) * fraction;
      final interval = Paint();
      if ((i + 1) % 5 == 0) {
        interval.strokeWidth = 2;
        interval.style = PaintingStyle.fill;
        interval.color = Colors.black;
      } else {
        interval.strokeWidth = 1;
        interval.style = PaintingStyle.fill;
        interval.color = Colors.red;
      }
      rotate(canvas, 200, 200, x);
      canvas.drawLine(Offset(circ * 2, 200), const Offset(200, 200), interval);
    }

    final bg = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(200, 200), circ * 0.8, bg);
  }

  void rotate(Canvas canvas, double cx, double cy, double rotation) {
    canvas.translate(cx, cy);
    canvas.rotate(rotation);
    canvas.translate(-cx, -cy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
