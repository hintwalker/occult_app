part of sunoom_calendar_input;

class GregorianDateController extends DateController {
  final GregorianDayValidator dayValidator;

  GregorianDateController({
    super.day,
    super.month,
    super.year,
    required this.dayValidator,
    required super.monthValidator,
    required super.yearValidator,
  });

  @override
  String? validateDay(String? value) {
    return dayValidator.validate(year, month, value);
  }
}
