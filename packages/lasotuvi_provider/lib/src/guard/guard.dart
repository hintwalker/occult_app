import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:tauari_guard/tauari_guard.dart';
import 'package:tauari_utils/tauari_utils.dart';

final guardProvider = Provider.autoDispose<Guard>(
  (ref) => Guard(
    networkChecker: availableNetwork,
    signedInUser: () => ref.read(takeCurrentUserProvider)(),
  ),
);
