
import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/clock_dimensions.dart';
import 'package:four_hand_clock_app/clock_intervals_view.dart';
import 'package:four_hand_clock_app/clock_painter.dart';
import 'package:four_hand_clock_app/hands_view.dart';

class ClockPage extends StatelessWidget {
  final double size;
  const ClockPage({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dimensions = ClockDimensions(0, size / 2, size / 2);
    return SizedBox(
      width: size,
      height: size,
      child: Column(
        children: [
          CustomPaint(
            painter: ClockPainter(dimensions),
          ),
          ClockIntervalsView(dimensions),
          HandView(
            dimensions,
            offsetSeconds: 0,
            color: Colors.red,
          ),
          HandView(
            dimensions,
            offsetSeconds: 15,
            color: Colors.blue,
          ),
          HandView(dimensions, offsetSeconds: 30, color: Colors.yellow),
          HandView(dimensions, offsetSeconds: 45, color: Colors.greenAccent),
        ],
      ),
    );
  }
}

class ClockPainter extends FourHandClockPainter {
  final ClockDimensions dimensions;

  ClockPainter(this.dimensions);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0xff63aa65)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(dimensions.offset, dimensions.circumference, paint1);
  }
}
