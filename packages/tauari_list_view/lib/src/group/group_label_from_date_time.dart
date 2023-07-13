import 'package:sunoom/sunoom.dart';

import '../../tauari_list_view.dart';

SimpleTextGroup groupLabelFromDateTime(
  DateTime dateTime,
  String Function(String) translate,
) {
  final moment = dateTime
      .toMoment(TimeZone(offsetInHour: dateTime.timeZoneOffset.inHours));
  final label =
      '${moment.toGregorianDateString()} (${moment.toLuniSolarDateString(canName: (can) => translate(can.name), chiName: (chi) => translate(chi.name))})';
  return SimpleTextGroup(
    dateTime
        .copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0)
        .millisecondsSinceEpoch
        .toString(),
    label,
  );
}
