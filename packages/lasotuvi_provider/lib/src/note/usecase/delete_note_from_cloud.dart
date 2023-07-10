import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/cloud_note_repository.dart';

final deleteNoteFromCloudProvider = Provider.autoDispose<DeleteNoteFromCloud>(
  (ref) => DeleteNoteFromCloud(ref.read(cloudNoteRepositoryProvider)),
);
