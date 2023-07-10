import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';

import '../usecase/on_tags.dart';

final tagListControllerProvider =
    ChangeNotifierProvider.autoDispose<TagListController>(
        (ref) => TagListController(onData: ref.read(onTagsProvider)));
