import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';
import '../../utils/check_network_status.dart';
import '../service/tag_cache_service.dart';

final tagCacheDataSourceProvider = Provider.autoDispose<TagCloudDataSource>(
  (ref) => TagCacheDataSource(
    ref.read(tagCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
