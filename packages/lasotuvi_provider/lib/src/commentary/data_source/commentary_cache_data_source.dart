import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

import '../../utils/check_network_status.dart';
import '../service/commentary_cache_service.dart';

final commentaryCacheDataSourceProvider =
    Provider.autoDispose<CommentaryCloudDataSource>(
  (ref) => CommentaryCacheDataSource(
    ref.read(commentaryCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
