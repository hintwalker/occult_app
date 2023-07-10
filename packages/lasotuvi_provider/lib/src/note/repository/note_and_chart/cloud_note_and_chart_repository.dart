import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../../chart/repository/cloud_chart_repository_provider.dart';
import '../../data_source/firebase_note_data_source.dart';

final cloudNoteAndChartRepositoryProvider =
    Provider.autoDispose<CloudNoteAndChartRepository>(
  (ref) => CloudNoteAndChartRepositoryImpl(
      ref.read(firebaseNoteDataSourceProvider),
      ownerRepository: ref.read(cloudChartRepositoryProvider)),
);
