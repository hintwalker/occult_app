part of tuvi_chart_creation_form;

class ChartCreationNotifer extends StateNotifier<ChartCreationState> {
  ChartCreationNotifer()
      : super(
          ChartCreationState(
            chart: Chart(DateTime.now().millisecondsSinceEpoch,
                name: 'noName',
                gender: Gender.female,
                birthday:
                    initialMoment(const TimeZone(offsetInHour: 7)).toDateTime(),
                watchingYear: DateTime.now().year,
                timeZoneOffset: 7,
                created: DateTime.now(),
                lastViewed: DateTime.now()),
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
