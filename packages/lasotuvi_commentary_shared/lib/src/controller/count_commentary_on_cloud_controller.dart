import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_ui/tauari_ui.dart';

class CountCommentaryOnCloudController
    extends CountOnCloudController<Commentary> {
  CountCommentaryOnCloudController({
    required super.onCountOnCloud,
    required super.checkNetworkStatus,
  });
}
