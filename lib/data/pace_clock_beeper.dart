import 'package:flutter_beep/flutter_beep.dart';
import 'package:four_hand_clock_app/data/local/shared_prefs.dart';

class PaceClockBeeper {
  static void playBeep() {
    final prefs = SharedPrefs.instance;
    if (!prefs.soundOn) return;
    if (!prefs.runInBackground && prefs.isMinimized) return;
    FlutterBeep.beep();
  }
}
