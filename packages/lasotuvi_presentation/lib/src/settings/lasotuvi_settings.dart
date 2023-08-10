import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_settings/tauari_settings.dart';

class LasotuviSettings {
  static Future<void> openSettingsBoxes() async {
    await TauariSettings.openBox(chartOptionsBoxName);
    await TauariSettings.openBox<List<dynamic>>(itemSelectedBoxName);
  }
}
