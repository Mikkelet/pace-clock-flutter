import 'dart:math';

import 'package:flutter/material.dart';

class HandView extends StatefulWidget {
  final double circ;
  final Color color;
  final double offsetSeconds;

  const HandView(this.circ,
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
          rotation: rotation, circ: widget.circ, color: widget.color),
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

class HandsPainter extends CustomPainter {
  final double rotation;
  final double circ;
  final Color color;

  HandsPainter({
    required this.rotation,
    required this.circ,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final hand1 = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    rotate(canvas, 200, 200);
    canvas.drawLine(
        Offset((circ * 2) * 0.9, 100), const Offset(200, 200), hand1);

    final cover = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(const Offset(200, 200), circ * 0.05, cover);
  }

  void rotate(Canvas canvas, double cx, double cy) {
    canvas.translate(cx, cy);
    canvas.rotate(rotation);
    canvas.translate(-cx, -cy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
