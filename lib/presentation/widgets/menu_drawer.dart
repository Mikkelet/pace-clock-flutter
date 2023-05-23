import 'package:flutter/material.dart';
import 'package:four_hand_clock_app/data/local/shared_prefs.dart';
import 'package:four_hand_clock_app/presentation/widgets/drawer_checkbox.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedPrefs = SharedPrefs.instance;

    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 64),
            const Text(
              "Pace clock",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            DrawerCheckbox(
                text: "Sound on",
                value: sharedPrefs.soundOn,
                onChanged: (value) {
                  sharedPrefs.soundOn = value ?? true;
                }),
            DrawerCheckbox(
                text: "Sound when minimized",
                value: sharedPrefs.runInBackground,
                onChanged: (value) {
                  sharedPrefs.runInBackground = value ?? true;
                }),
            const SizedBox(height: 64),
            const Text(
              "Made by Mikkel Thygesen in 🇩🇰",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
