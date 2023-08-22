import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../utils/check_network_status.dart';
import '../service/commentary_firestore_service.dart';

final commentaryFirestoreDataSourceProvider =
    Provider.autoDispose<CommentaryCloudDataSource>(
  (ref) => CommentaryFirestoreDataSource(
    ref.read(commentaryFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
