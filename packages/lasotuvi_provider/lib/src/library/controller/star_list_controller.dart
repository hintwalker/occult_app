import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/src/library/usecase/take_all_star_list.dart';

final starListControllerProvider =
    ChangeNotifierProvider.autoDispose<StarListController>(
  (ref) => StarListController(
    ref.read(
      takeAllStarListProvider,
    ),
  ),
);
