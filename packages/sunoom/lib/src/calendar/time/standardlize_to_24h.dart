int standardlizeTo24h(int hour) {
  if (hour == 24) {
    return 0;
  }
  if (hour < 0) {
    throw Exception();
  }
  if (hour > 24) {
    final k = hour ~/ 24;
    return hour - k * 24;
  }
  return hour;
}
