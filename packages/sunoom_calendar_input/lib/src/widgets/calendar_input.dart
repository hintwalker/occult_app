import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../controllers/calendar_editor_controller.dart';
import '../controllers/date_name_group_controller.dart';
import '../controllers/gregorian_date_controller.dart';
import '../controllers/leap_month_options_controller.dart';
import '../controllers/luni_date_controller.dart';
import '../controllers/time_controller.dart';
import '../validators/gregorian_day_validator.dart';
import '../validators/hour_validator.dart';
import '../validators/luni_day_validator.dart';
import '../validators/minute_validator.dart';
import '../validators/month_validator.dart';
import '../validators/year_validator.dart';
import 'date_input.dart';
import 'date_name_group.dart';
import 'leap_month_options_input.dart';
import 'time_input.dart';
import 'weekday_name.dart';

class CalendarInput extends StatefulWidget {
  const CalendarInput({
    super.key,
    required this.translate,
    this.colorScheme,
    required this.onDateChanged,
    // required this.onValidate,
    this.initValue,
  });

  final String Function(String) translate;
  final ColorScheme? colorScheme;

  final void Function(Moment? moment, {required bool valid}) onDateChanged;
  final Moment? initValue;
  // final void Function(bool valid) onValidate;

  @override
  State<StatefulWidget> createState() => _CalendarInputState();
}

class _CalendarInputState extends State<CalendarInput> {
  final _monthValidator = MonthValidator();
  final _yearValidator = YearValidator();
  final _hourValidator = HourValidator();
  final _minuteValidator = MinuteValidator();

  late GregorianDayValidator _gregDayValidator;
  late LuniDayValidator _luniDayValidator;
  late GregorianDateController _gregController;
  late LuniDateController _luniController;
  late TimeController _timeController;
  late LeapMonthOptionsController _leapMonthOptionsController;
  late CalendarEditorController _calendarEditorController;
  late DateNameGroupController _dateNameGroupController;
  @override
  void initState() {
    super.initState();
    final moment = widget.initValue ??
        DateTime(1995, 5, 6, 4, 30).toMoment(const TimeZone(offsetInHour: 7));

    _timeController = TimeController(
      moment.time.hour,
      moment.time.minute,
      hourValidator: _hourValidator,
      minuteValidator: _minuteValidator,
    );
    _gregDayValidator = GregorianDayValidator(
      validateMonth: _monthValidator.validate,
      validateYear: _yearValidator.validate,
    );
    _luniDayValidator = LuniDayValidator(
      validateMonth: _monthValidator.validate,
      validateYear: _yearValidator.validate,
    );
    _gregController = GregorianDateController(
      day: moment.gregorian.day,
      month: moment.gregorian.month,
      year: moment.gregorian.year,
      dayValidator: _gregDayValidator,
      monthValidator: _monthValidator,
      yearValidator: _yearValidator,
    );
    _luniController = LuniDateController(
      day: moment.luniSolarDate.day,
      month: moment.luniSolarDate.month,
      year: moment.luniSolarDate.year,
      isMonthLeap: false,
      timeZoneOffset: moment.timeZone.offsetInHour,
      dayValidator: _luniDayValidator,
      monthValidator: _monthValidator,
      yearValidator: _yearValidator,
    );
    _leapMonthOptionsController = LeapMonthOptionsController();
    _dateNameGroupController = DateNameGroupController();
    _calendarEditorController = CalendarEditorController(
        gregController: _gregController,
        luniController: _luniController,
        timeController: _timeController,
        leapMonthOptionsController: _leapMonthOptionsController,
        dateNameGroupController: _dateNameGroupController,
        onDateChanged: widget.onDateChanged,
        // onValidate: widget.onValidate,
        timeZone: moment.timeZone);
    _calendarEditorController.listen();
  }

  @override
  void dispose() {
    _calendarEditorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.today),
            const SizedBox(width: 16.0),
            WeekdayName(
                controller: _gregController, translate: widget.translate),
          ],
        ),
        DateInput(_gregController),
        const SizedBox(
          height: 12,
        ),
        DateInput(_luniController),
        const SizedBox(
          height: 8,
        ),
        DateNameGroup(
          _dateNameGroupController,
          colorScheme: widget.colorScheme,
        ),
        const SizedBox(
          height: 12,
        ),
        LeapMonthOptionsInput(
          _leapMonthOptionsController,
          translate: widget.translate,
          colorScheme: widget.colorScheme,
        ),
        const SizedBox(
          height: 16,
        ),
        TimeInput(_timeController),
      ],
    );
  }
}
