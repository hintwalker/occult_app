import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_repository_provider.dart';
import 'cloud_note_repository.dart';
import 'local_note_repository.dart';

final noteRepositoryProvider = Provider.autoDispose<NoteRepository>(
  (ref) => NoteRepositoryImpl(
      localDependentRepository: ref.read(localNoteRepositoryProvider),
      cloudDependentRepository: ref.read(cloudNoteRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
