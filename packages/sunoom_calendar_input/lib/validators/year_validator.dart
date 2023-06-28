part of sunoom_calendar_input;

class YearValidator {
  final errorMessage = '!';
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    final intValue = int.parse(value);
    return intValue < 1 || intValue > 9999 ? errorMessage : null;
  }
}
