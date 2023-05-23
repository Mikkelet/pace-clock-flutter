import 'dart:math';

import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/presentation/clock_page.dart';
import 'package:four_hand_clock_app/presentation/themes/ClockTheme.dart';

void main() {
  runApp(const FourHandClock());
}

class FourHandClock extends StatelessWidget {
  const FourHandClock({super.key});

  @override
  Widget build(BuildContext context) {
    final winW = MediaQuery.of(context).size.width;
    final winH = MediaQuery.of(context).size.height;
    final minW = min(winH, winW);
    final clockSize = minW * 0.9;

    return MaterialApp(
      title: 'Four hand clock',
      darkTheme:
          ThemeData(colorScheme: const ClockTheme.dark(), useMaterial3: true),
      theme: ThemeData(
        colorScheme: const ClockTheme(),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(child: ClockPage(size: clockSize)),
      ),
    );
  }
}
