import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/request_repository.dart';

final onRequestProvider = Provider.autoDispose<OnRequestById>(
    (ref) => OnRequestById(ref.read(requestRepositoryProvider)));
