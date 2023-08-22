import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_local_repository.dart';
import '../data_source/sqlite_request_data_source.dart';

final localRequestRepositoryProvider =
    Provider.autoDispose<RequestLocalRepositoryImpl>(
  (ref) => RequestLocalRepositoryImpl(ref.read(sqliteRequestDataSourceProvider),
      ownerIdColumn: ColumnRequest.chartId,
      ownerRepository: ref.read(chartLocalRepositoryProvider),
      entityToModel: (request) => RequestModel.fromEntity(request)),
);
