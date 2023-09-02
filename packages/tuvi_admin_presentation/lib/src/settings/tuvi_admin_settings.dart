import 'package:tauari_list_view/tauari_list_view.dart';
import 'package:tauari_settings/tauari_settings.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';

class TuviAdminSettings {
  static Future<void> openSettingsBoxes() async {
    await TauariSettings.openBox(chartOptionsBoxName);
    await TauariSettings.openBox<List<dynamic>>(itemSelectedBoxName);
  }
}
