class MonthValidator {
  final errorMessage = '!';
  String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return errorMessage;
    }
    final intValue = int.parse(value);
    return intValue < 1 || intValue > 12 ? errorMessage : null;
  }
}
