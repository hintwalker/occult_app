import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/src/library/tu_hoa/usecase/take_all_tu_hoa_list.dart';

final tuHoaListNotifierProvider =
    StateNotifierProvider<TuHoaListNotifier, TuHoaListState>(
  (ref) => TuHoaListNotifier(
    takeAllTuHoaList: ref.read(takeAllTuHoaListProvider),
  ),
);
