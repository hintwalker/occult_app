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

  const LifeMilestone.initial({
    this.month = 0,
    this.year = const Chi.initial(),
    this.decade = 0,
  });

  factory LifeMilestone.unknown() {
    return LifeMilestone(month: -1, year: Chi.fromEnum(Chies.tys), decade: -1);
  }
}
