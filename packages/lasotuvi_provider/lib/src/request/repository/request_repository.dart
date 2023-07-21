import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../../chart/repository/chart_repository.dart';
import 'cloud_request_repository.dart';
import 'local_request_repository.dart';

final requestRepositoryProvider = Provider.autoDispose<RequestRepository>(
  (ref) => RequestRepositoryImpl(
      localDependentRepository: ref.read(localRequestRepositoryProvider),
      cloudDependentRepository: ref.read(cloudRequestRepositoryProvider),
      ownerRepository: ref.read(chartRepositoryProvider)),
);
