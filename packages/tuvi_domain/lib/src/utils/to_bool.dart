extension StringExtension on String {
  bool toBoolean([bool strict = false]) {
    if (strict == true) {
      return this == '1' || this == 'true';
    }
    return this != '0' && this != 'false' && this != '';
  }
}
