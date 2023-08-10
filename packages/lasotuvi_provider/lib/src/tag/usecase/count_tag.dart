import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/tag_repository.dart';

final countTagProvider = Provider(
  (ref) => CountTag(
    ref.read(
      tagRepositoryProvider,
    ),
  ),
);
