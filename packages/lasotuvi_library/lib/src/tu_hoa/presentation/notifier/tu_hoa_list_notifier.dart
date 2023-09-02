import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../presentation/state/tu_hoa_list_state.dart';
import '../../domain/use_case/take_all_tu_hoa_list.dart';

class TuHoaListNotifier extends StateNotifier<TuHoaListState> {
  TuHoaListNotifier({
    required this.takeAllTuHoaList,
  }) : super(const TuHoaListState.initial());

  final TakeAllTuHoaList takeAllTuHoaList;

  Future<void> fetchData(String school) async {
    state = state.copyWith(workingState: TuHoaListWorkingState.loading);
    final data = await takeAllTuHoaList();

    state = state.copyWith(
      workingState: TuHoaListWorkingState.success,
      data: data.where((element) => element.school == school),
    );
  }
}
