import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late SharedPreferences _sharedPrefs;

  static SharedPrefs? _instance;

  static SharedPrefs get instance {
    return _instance ??= SharedPrefs._();
  }

  SharedPrefs._();

  Future initialise() async {
    _sharedPrefs = await SharedPreferences.getInstance();
    return 0;
  }

  // run in background
  bool get runInBackground => _sharedPrefs.getBool(runInBackgroundKey) ?? false;

  set runInBackground(bool value) =>
      _sharedPrefs.setBool(runInBackgroundKey, value);

  // sound
  bool get soundOn => _sharedPrefs.getBool(soundOnKey) ?? true;

  set soundOn(bool value) => _sharedPrefs.setBool(soundOnKey, value);

  // app lifecycle state
  bool get isMinimized => _sharedPrefs.getBool(minimizedKey) ?? false;

  set isMinimized(bool value) => _sharedPrefs.setBool(minimizedKey, value);

  static const soundOnKey = "sound_on";
  static const runInBackgroundKey = "run_in_background";
  static const minimizedKey = "minimized";
}
