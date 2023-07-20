import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../data_source/firebase_request_data_source.dart';

final cloudRequestRepositoryProvider =
    Provider.autoDispose<CloudRequestRepository>((ref) =>
        CloudRequestRepositoryImpl(
            ref.read(firebaseRequestDataSourceProvider)));
