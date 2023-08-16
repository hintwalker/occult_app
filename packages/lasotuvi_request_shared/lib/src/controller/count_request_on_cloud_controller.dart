import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class CountRequestOnCloudController extends CountOnCloudController<Request> {
  CountRequestOnCloudController({
    required super.onCountOnCloud,
    required super.checkNetworkStatus,
  });
}
