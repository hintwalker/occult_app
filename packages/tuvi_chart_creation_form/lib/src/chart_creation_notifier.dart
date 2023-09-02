import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_chart_domain/tuvi_chart_domain.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'initial_moment.dart';
import 'state/chart_creation_state.dart';

class ChartCreationNotifer extends StateNotifier<ChartCreationState> {
  ChartCreationNotifer()
      : super(
          ChartCreationState(
            chart: Chart.empty().copyWith(
              name: 'Unnamed',
              birthday: initialMoment(
                const TimeZone(offsetInHour: 7),
              ).toDateTime(),
            )
            // Chart(DateTime.now().millisecondsSinceEpoch,
            //     name: 'noName',
            //     gender: Gender.female,
            //     birthday:
            //         initialMoment(const TimeZone(offsetInHour: 7)).toDateTime(),
            //     watchingYear: DateTime.now().year,
            //     timeZoneOffset: 7,
            //     created: DateTime.now(),
            //     lastViewed: DateTime.now(),
            //     modified: DateTime.now().millisecondsSinceEpoch)
            ,
            valid: true,
          ),
        );

  void updateName(String value) {
    state = state.copyWith(chart: state.chart.copyWith(name: value));
  }

  void updateGender(Gender value) {
    state = state.copyWith(chart: state.chart.copyWith(gender: value));
  }

  void updateAvatar(String? path) {
    state = state.copyWith(chart: state.chart.copyWith(avatar: path));
  }

  void updateBirthday(Moment moment) {
    state = state.copyWith(
        chart: state.chart.copyWith(
            birthday: moment.toDateTime(),
            timeZoneOffset: moment.timeZone.offsetInHour));
  }

  void updateWatchingYear(String value) {
    state = state.copyWith(
        chart: state.chart.copyWith(watchingYear: int.parse(value)));
  }

  void updateValid(bool valid) {
    state = state.copyWith(valid: valid);
  }
}

final chartCreationNotifierProvider =
    StateNotifierProvider.autoDispose<ChartCreationNotifer, ChartCreationState>(
        (ref) => ChartCreationNotifer());
