import 'dart:math';

import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/clock_dimensions.dart';
import 'package:four_hand_clock_app/clock_painter.dart';

class ClockIntervalsView extends StatelessWidget {
  final ClockDimensions dimensions;

  const ClockIntervalsView(this.dimensions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: IntervalsPainter(dimensions),
    );
  }
}

class IntervalsPainter extends FourHandClockPainter {
  final ClockDimensions dimensions;

  static const fraction = 1 / 60;
  static const rotation = (2 * pi) * fraction;

  IntervalsPainter(this.dimensions) : super();

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < 60; i++) {
      final paint = Paint();
      if ((i + 1) % 5 == 0) {
        paint.strokeWidth = 2;
        paint.style = PaintingStyle.fill;
        paint.color = Colors.black;
      } else {
        paint.strokeWidth = 1;
        paint.style = PaintingStyle.fill;
        paint.color = Colors.red;
      }
      rotateLine(canvas, dimensions.offset, rotation);
      canvas.drawLine(dimensions.offset,
          Offset(dimensions.circumference, dimensions.y), paint);
    }

    final bg = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(dimensions.offset, dimensions.circumference * 0.8, bg);
  }
}
