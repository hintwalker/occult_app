import '../validators/luni_day_validator.dart';
import 'date_controller.dart';

class LuniDateController extends DateController {
  LuniDateController({
    super.day,
    super.month,
    super.year,
    required this.isMonthLeap,
    required this.timeZoneOffset,
    required this.dayValidator,
    required super.monthValidator,
    required super.yearValidator,
  });
  final LuniDayValidator dayValidator;
  bool isMonthLeap;
  int timeZoneOffset;

  @override
  String? validateDay(String? value) => dayValidator.validate(
        year,
        month,
        value,
        isMonthLeap: isMonthLeap,
        timeZoneOffset: timeZoneOffset,
      );

  void showLeapMonthOptions() {}

  void hideLeapMonthOptions() {}
}
