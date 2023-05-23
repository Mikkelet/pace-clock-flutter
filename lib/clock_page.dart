import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/clock_intervals_view.dart';
import 'package:four_hand_clock_app/hands_view.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final circ = (MediaQuery.of(context).size.width - 10) / 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Four hand clock"),
      ),
      body: Column(
        children: [
          CustomPaint(
            painter: ClockPainter(circ),
          ),
          ClockIntervalsView(circ),
          HandView(circ, offsetSeconds: 0, color: Colors.red,),
          HandView(circ, offsetSeconds: 15, color: Colors.blue,),
          HandView(circ, offsetSeconds: 30, color: Colors.yellow),
          HandView(circ, offsetSeconds: 45, color: Colors.greenAccent),
        ],
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final double circ;

  ClockPainter(this.circ);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = const Color(0xff63aa65)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
      canvas.drawCircle(const Offset(200, 200), circ, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
