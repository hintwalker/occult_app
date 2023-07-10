extension DateTimeToStringVn on DateTime {
  String toStringVn() {
    return '$day/$month/$year, $hour:$minute';
  }
}
