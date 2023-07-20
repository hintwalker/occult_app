import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/local_request_repository.dart';

final deleteRequestFromLocalProvider =
    Provider.autoDispose<DeleteRequestFromLocal>(
  (ref) => DeleteRequestFromLocal(ref.read(localRequestRepositoryProvider)),
);
