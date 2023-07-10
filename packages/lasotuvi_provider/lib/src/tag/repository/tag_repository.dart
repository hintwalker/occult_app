import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_data/lasotuvi_data.dart';

import 'cloud_tag_repository.dart';
import 'local_tag_repository.dart';

final tagRepositoryProvider = Provider.autoDispose<TagRepositoryImpl>(
  (ref) => TagRepositoryImpl(
      localRepository: ref.read(localTagRepositoryProvider),
      cloudRepository: ref.read(cloudTagRepositoryProvider)),
);
