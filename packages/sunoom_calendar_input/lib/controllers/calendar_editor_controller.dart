part of sunoom_calendar_input;

class CalendarEditorController {
  final GregorianDateController gregController;
  final LuniDateController luniController;
  final TimeController timeController;
  final LeapMonthOptionsController leapMonthOptionsController;
  final DateNameGroupController dateNameGroupController;
  LuniSolarDate? luniSolarDate;
  GregorianDate? gregorianDate;
  SimpleTime? time;
  Moment? moment;
  TimeZone timeZone;
  void Function(Moment) onDateChanged;
  // final CanChiController canChiController;
  CalendarEditorController({
    required this.gregController,
    required this.luniController,
    required this.timeController,
    required this.leapMonthOptionsController,
    required this.dateNameGroupController,
    required this.onDateChanged,
    required this.timeZone,

    // required this.canChiController,
  });

  void listen() {
    ready();
    gregController.addListener(onGregorianDateChanged);
    luniController.addListener(onLuniSolarDateChanged);
    leapMonthOptionsController.addListener(onLeapMonthChanged);
    timeController.addListener(onTimeChanged);
  }

  void ready() {
    initWithGregorian();
    setLuniSolarInput();
    setDateNameGroup();
    setLeapMonthInput();
    setTimeInput();
  }

  void initWithGregorian() {
    initTime();
    gregorianDate = GregorianDate(
        year: gregController.year!,
        month: gregController.month!,
        day: gregController.day!,
        timeZone: timeZone);
    luniSolarDate = gregorian2LuniSolar(
      gregorian: gregorianDate!,
      time: time!,
    );
    moment = Moment.fromGregorian(gregorianDate!, time);
  }

  void initTime() {
    time = SimpleTime(
      hour: timeController.hour ?? 1,
      minute: timeController.minute ?? 30,
    );
  }

  void initWithLuniSolar([bool isLeapMonth = false]) {
    initTime();
    luniSolarDate = LuniSolarDate(
      year: luniController.year!,
      month: luniController.month!,
      day: luniController.day!,
      isLeapMonth: isLeapMonth,
      timeZone: timeZone,
    );
    gregorianDate = luniSolar2Gregorian(luniSolarDate!);
    moment = Moment.fromGregorian(gregorianDate!, time);
  }

  void dispose() {
    gregController.removeListener(onGregorianDateChanged);
    luniController.removeListener(onLuniSolarDateChanged);
    leapMonthOptionsController.removeListener(onLeapMonthChanged);
    timeController.removeListener(onTimeChanged);
  }

  void onTimeChanged() {
    if (timeController.state == null) {
      return;
    }
    if (timeController.state!.validate()) {
      initWithGregorian();
      setLuniSolarInput();
      setLeapMonthInput();
      setDateNameGroup();
      onDateChanged(moment!);
    } else {
      clearLuniSolarInput();
      clearLeapMonthInput();
      clearDateNameGroup();
      clearCache();
    }
  }

  void onGregorianDateChanged() {
    if (gregController.state == null) {
      return;
    }
    if (gregController.state!.validate()) {
      initWithGregorian();
      setLuniSolarInput();
      setLeapMonthInput();
      setDateNameGroup();
      onDateChanged(moment!);
    } else {
      clearLuniSolarInput();
      clearLeapMonthInput();
      clearDateNameGroup();
      clearCache();
    }
  }

  void clearCache() {
    luniSolarDate = null;
    gregorianDate = null;
  }

  void setTimeInput() {
    timeController.setHour(time!.hour);
    timeController.setMinute(time!.minute);
  }

  void setLuniSolarInput() {
    luniController.setDay(luniSolarDate!.day);
    luniController.setMonth(luniSolarDate!.month);
    luniController.setYear(luniSolarDate!.year);
  }

  void clearLuniSolarInput() {
    luniController.setDay(null);
    luniController.setMonth(null);
    luniController.setYear(null);
  }

  void clearLeapMonthInput() {
    leapMonthOptionsController.changedByUser = true;
    leapMonthOptionsController.hideLeapMonthOptions();
  }

  void clearDateNameGroup() {
    dateNameGroupController.setDayCan(null);
    dateNameGroupController.setDayChi(null);
    dateNameGroupController.setMonthCan(null);
    dateNameGroupController.setMonthChi(null);
    dateNameGroupController.setYearCan(null);
    dateNameGroupController.setYearChi(null);
  }

  void setLeapMonthInput() {
    leapMonthOptionsController.changedByUser = true;
    leapMonthOptionsController.toggle(
      gregorianDate: gregorianDate!,
      luniSolarDate: luniSolarDate!,
      timeZoneOffset: 7,
    );
  }

  void setDateNameGroup() {
    final dayCan = Can.ofDay(Moment.fromGregorian(gregorianDate!, time));
    final dayChi = Chi.ofGregorianDay(date: gregorianDate!, time: time);
    dateNameGroupController.setDayCan(dayCan.value);
    dateNameGroupController.setDayChi(dayChi.value);

    final monthCan =
        Can.ofLuniMonth(year: luniSolarDate!.year, month: luniSolarDate!.month);
    final monthChi = Chi.ofLuniMonth(luniSolarDate!.month);
    dateNameGroupController.setMonthCan(monthCan.value);
    dateNameGroupController.setMonthChi(monthChi.value);

    final yearCan = Can.ofLuniYear(luniSolarDate!.year);
    final yearChi = Chi.ofLuniYear(luniSolarDate!.year);
    dateNameGroupController.setYearCan(yearCan.value);
    dateNameGroupController.setYearChi(yearChi.value);
  }

  void onLuniSolarDateChanged() {
    if (luniController.state == null) {
      return;
    }
    if (luniController.state!.validate()) {
      initWithLuniSolar();
      setGregorianInput();
      setLeapMonthInput();
      setDateNameGroup();
      onDateChanged(moment!);
    } else {
      clearGregorianInput();
      clearLeapMonthInput();
      clearDateNameGroup();
      clearCache();
    }
  }

  void clearGregorianInput() {
    gregController.setDay(null);
    gregController.setMonth(null);
    gregController.setYear(null);
  }

  void setGregorianInput() {
    gregController.setDay(gregorianDate!.day);
    gregController.setMonth(gregorianDate!.month);
    gregController.setYear(gregorianDate!.year);
  }

  void onLeapMonthChanged() {
    if (!leapMonthOptionsController.changedByUser) {
      initWithLuniSolar(leapMonthOptionsController.isLeapMonth);
      setGregorianInput();
      setDateNameGroup();
      onDateChanged(moment!);
    }
  }
}
