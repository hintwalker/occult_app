import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/chart_repository.dart';
import 'cloud_note_and_chart_repository.dart';
import 'local_note_and_chart_repository.dart';

final noteAndChartRepositoryProvider =
    Provider.autoDispose<NoteAndChartRepository>(
  (ref) => NoteAndChartRepositoryImpl(
      localDependentRepository: ref.read(localNoteAndChartRepositoryProvider),
      cloudDependentRepository: ref.read(cloudNoteAndChartRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
