import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_provider/src/tag/usecase/on_count_tag.dart';
import 'package:lasotuvi_tag_shared/lasotuvi_tag_shared.dart';

final countTagEveryWhereControllerProvider =
    ChangeNotifierProvider.autoDispose<CountTagEveryWhereController>(
  (ref) => CountTagEveryWhereController(
    ref.read(onCountTagProvider),
  ),
);
