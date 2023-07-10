import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> availableNetwork() async {
  final connectivityResult = await (Connectivity().checkConnectivity());
  return connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.vpn;
}
