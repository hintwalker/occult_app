import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import '../../utils/check_network_status.dart';
import '../service/note_firestore_service.dart';

final noteFirestoreDataSourceProvider =
    Provider.autoDispose<NoteFirestoreDataSource>(
  (ref) => NoteFirestoreDataSource(
    ref.read(noteFirestoreServiceProvider),
    availableNetwork: ref.read(checkNetworkStatusProvider).call,
  ),
);
