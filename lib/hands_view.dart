import 'dart:math';

import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/clock_dimensions.dart';
import 'package:four_hand_clock_app/clock_painter.dart';

class HandView extends StatefulWidget {
  final ClockDimensions dimensions;
  final Color color;
  final double offsetSeconds;

  const HandView(this.dimensions,
      {Key? key, this.offsetSeconds = 0, this.color = Colors.red})
      : super(key: key);

  @override
  State<HandView> createState() => _HandViewState();
}

class _HandViewState extends State<HandView> {
  double rotation = 0;

  @override
  void initState() {
    rotate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HandsPainter(
          rotation: rotation, dimens: widget.dimensions, color: widget.color),
    );
  }

  void rotate() async {
    final now = DateTime.now();
    final second = now.second + widget.offsetSeconds;
    final millis = now.millisecond / 1000;
    final secondsWithMillis = second + millis;
    const rotationPrSecond = (2 * pi) / 60;
    setState(() {
      rotation = rotationPrSecond * secondsWithMillis;
    });

    await Future.delayed(const Duration(milliseconds: 100));
    rotate();
  }
}

class HandsPainter extends FourHandClockPainter {
  final ClockDimensions dimens;
  final double rotation;
  final Color color;

  HandsPainter({
    required this.rotation,
    required this.dimens,
    required this.color,
  }) : super();

  @override
  void paint(Canvas canvas, Size size) {
    final hand1 = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    rotateLine(canvas, dimens.offset, rotation);
    canvas.drawLine(dimens.offset, Offset(dimens.circumference, dimens.y), hand1);

    final cover = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(dimens.offset, dimens.circumference * 0.1, cover);
  }
}
