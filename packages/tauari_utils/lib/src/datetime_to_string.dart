String dateTimeToString(DateTime dateTime) {
  return '${dateTime.day}/${dateTime.month}/${dateTime.year} | ${dateTime.hour}:${dateTime.minute}:${dateTime.second} (${utcText(dateTime.timeZoneOffset)})';
}

String utcText(Duration value) {
  if (!value.isNegative) {
    return 'UTC+${value.inHours}';
  } else {
    return 'UTC${value.inHours}';
  }
}
