import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/request_repository.dart';

final downloadRequestProvider = Provider.autoDispose<DownloadRequest>(
  (ref) => DownloadRequest(ref.read(requestRepositoryProvider)),
);
