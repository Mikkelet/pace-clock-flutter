import 'dart:math';

import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/presentation/clock_page.dart';
import 'package:four_hand_clock_app/data/local/shared_prefs.dart';
import 'package:four_hand_clock_app/presentation/themes/ClockTheme.dart';
import 'package:four_hand_clock_app/presentation/widgets/menu_button.dart';
import 'package:four_hand_clock_app/presentation/widgets/menu_drawer.dart';

class FourHandClock extends StatefulWidget with WidgetsBindingObserver {
  const FourHandClock({super.key});

  @override
  State<FourHandClock> createState() => _FourHandClockState();
}

class _FourHandClockState extends State<FourHandClock>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      SharedPrefs.instance.isMinimized = true;
    } else if (state == AppLifecycleState.resumed) {
      SharedPrefs.instance.isMinimized = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final winW = MediaQuery.of(context).size.width;
    final winH = MediaQuery.of(context).size.height;
    final minW = min(winH, winW);
    final clockSize = minW * 0.9;

    return MaterialApp(
      title: 'Four hand clock',
      darkTheme: ThemeData(
        colorScheme: const ClockTheme.dark(),
        useMaterial3: true,
      ),
      theme: ThemeData(
        colorScheme: const ClockTheme(),
        useMaterial3: true,
      ),
      home: Scaffold(
        endDrawer: const MenuDrawer(),
        body: FutureBuilder(
            future: SharedPrefs.instance.initialise(),
            builder: (context, snap) {
              if (!snap.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return OrientationBuilder(builder: (context, orientation) {
                if (orientation == Orientation.portrait) {
                  return Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 64),
                            child: MenuButton(),
                          )
                        ],
                      ),
                      const SizedBox(height: 32),
                      ClockPage(size: clockSize),
                    ],
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 112),
                    Center(child: ClockPage(size: clockSize)),
                    const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 32),
                          child: MenuButton(),
                        )
                      ],
                    )
                  ],
                );
              });
            }),
      ),
    );
  }
}
