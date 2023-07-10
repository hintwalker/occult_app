import 'package:sunoom/sunoom.dart';

class LifeMilestone {
  final int month;
  final Chi year;
  final int decade;
  const LifeMilestone({
    required this.month,
    required this.year,
    required this.decade,
  });

  factory LifeMilestone.unknown() {
    return LifeMilestone(month: -1, year: Chi.fromEnum(Chies.tys), decade: -1);
  }
}
