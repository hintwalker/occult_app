import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class CountTagOnCloudController extends CountOnCloudController<Tag> {
  CountTagOnCloudController({
    required super.onCountOnCloud,
    required super.checkNetworkStatus,
  });
}
