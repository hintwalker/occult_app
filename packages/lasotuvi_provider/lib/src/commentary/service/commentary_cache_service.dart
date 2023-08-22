import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import '../../utils/check_network_status.dart';

final commentaryCacheServiceProvider = Provider(
  (ref) => CommentaryCacheService(
      availableNetwork: ref.read(checkNetworkStatusProvider).call),
);
