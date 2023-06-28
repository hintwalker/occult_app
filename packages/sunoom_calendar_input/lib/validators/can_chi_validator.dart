part of sunoom_calendar_input;

class CanChiValidator {
  final errorMessage = '!';
  String? validate(Cans? can, Chies? chi) {
    if (can == null || chi == null) {
      return errorMessage;
    }
    return can.index % 2 == chi.index % 2 ? null : errorMessage;
  }
}
