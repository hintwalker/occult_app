part of tuvi_chart_creation_form;

class ChartCreationNotifer extends StateNotifier<Chart> {
  ChartCreationNotifer()
      : super(Chart(DateTime.now().millisecondsSinceEpoch,
            name: '',
            gender: Gender.female,
            birthday:
                initialMoment(const TimeZone(offsetInHour: 7)).toDateTime(),
            watchingYear: 2023,
            timeZoneOffset: 7,
            created: DateTime.now(),
            lastViewed: DateTime.now()));

  void updateName(String value) {
    state = state.copyWith(name: value);
  }

  void updateGender(Gender value) {
    state = state.copyWith(gender: value);
  }

  void updateAvatar(String? path) {
    state = state.copyWith(avatar: path);
  }

  void updateBirthday(Moment moment) {
    state = state.copyWith(
        birthday: moment.toDateTime(),
        timeZoneOffset: moment.timeZone.offsetInHour);
  }

  void updateWatchingYear(String value) {
    state = state.copyWith(watchingYear: int.parse(value));
  }
}

final chartCreationNotifierProvider =
    StateNotifierProvider.autoDispose<ChartCreationNotifer, Chart>(
        (ref) => ChartCreationNotifer());
