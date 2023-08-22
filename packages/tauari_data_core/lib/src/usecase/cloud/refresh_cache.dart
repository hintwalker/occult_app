import 'package:tauari_data_core/tauari_data_core.dart';

class RefreshCache {
  const RefreshCache(this.cloudService);
  final CloudService cloudService;
  void call() => cloudService.triggerUpdate();
}
