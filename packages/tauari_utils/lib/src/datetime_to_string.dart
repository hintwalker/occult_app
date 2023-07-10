String dateTimeToString(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} | ${dateTime.hour}:${dateTime.minute}:${dateTime.second} (UTC${dateTime.timeZoneOffset.inHours})';
}
