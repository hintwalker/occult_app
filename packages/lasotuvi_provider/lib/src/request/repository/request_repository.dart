import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import 'cloud_request_repository.dart';
import 'local_request_repository.dart';

final requestRepositoryProvider = Provider.autoDispose((ref) =>
    RequestRepositoryImpl(
        localRepository: ref.read(localRequestRepositoryProvider),
        cloudRepository: ref.read(cloudRequestRepositoryProvider)));
