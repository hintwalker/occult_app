import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';

import '../repository/tag_repository.dart';

final onTagsProvider = Provider.autoDispose<OnTags>(
    (ref) => OnTags(ref.read(tagRepositoryProvider)));
