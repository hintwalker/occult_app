class MinuteValidator {
  final String errorMessage = '!';
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    final intValue = int.parse(value);
    if (intValue < 0 || intValue > 59) {
      return errorMessage;
    }
    return null;
  }
}
