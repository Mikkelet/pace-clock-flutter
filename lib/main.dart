import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/clock_page.dart';

void main() {
  runApp(const FourHandClock());
}

class FourHandClock extends StatelessWidget {
  const FourHandClock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Four hand clock',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ClockPage(),
    );
  }
}

