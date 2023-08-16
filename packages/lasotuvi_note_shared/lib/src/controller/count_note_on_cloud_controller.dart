import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class CountNoteOnCloudController extends CountOnCloudController<Note> {
  CountNoteOnCloudController({
    required super.onCountOnCloud,
    required super.checkNetworkStatus,
  });
}
