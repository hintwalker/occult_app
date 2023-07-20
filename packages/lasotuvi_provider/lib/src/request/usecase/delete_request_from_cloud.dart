import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/cloud_request_repository.dart';

final deleteRequestFromCloudProvider =
    Provider.autoDispose<DeleteRequestFromCloud>(
  (ref) => DeleteRequestFromCloud(ref.read(cloudRequestRepositoryProvider)),
);
