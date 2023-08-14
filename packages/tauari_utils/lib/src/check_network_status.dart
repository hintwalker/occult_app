import 'package:tauari_utils/src/available_network.dart';

class CheckNetworkStatus {
  Future<bool> call() => availableNetwork();
}
