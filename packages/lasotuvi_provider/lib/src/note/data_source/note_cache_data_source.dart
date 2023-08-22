import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lstv_firestore_cache/lstv_firestore_cache.dart';

import '../../utils/check_network_status.dart';
import '../service/note_cache_service.dart';

final noteCacheDataSourceProvider = Provider.autoDispose<NoteCloudDataSource>(
  (ref) => NoteCacheDataSource(
    ref.read(noteCacheServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
