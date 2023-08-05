import 'package:hive/hive.dart';

class IsFirstRun {
  static const _firstRunSettingsKey = 'is_first_run';
  static Future<bool> isFirstCall() async {
    final box = await Hive.openBox<bool>('isFirstRun');
    final firstCall = box.get(_firstRunSettingsKey, defaultValue: true) ?? true;
    if (firstCall) {
      await box.put(_firstRunSettingsKey, false);
    }
    return firstCall;
  }
}
