import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import '../../utils/check_network_status.dart';
import '../service/tag_firestore_service.dart';

final tagFirestoreDataSourceProvider = Provider.autoDispose<TagCloudDataSource>(
  (ref) => TagFirestoreDataSource(
    ref.read(tagFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
