part of sunoom_calendar_input;

class CanChiController extends ChangeNotifier {
  bool changedByOutside = false;
  DateNameController<Cans>? dayCanController;

  DateNameController<Chies>? dayChiController;

  DateNameController<Cans>? monthCanController;

  DateNameController<Chies>? monthChiController;

  DateNameController<Cans>? yearCanController;

  DateNameController<Chies>? yearChiController;

  void setCanDay(Cans? value) {
    if (dayCanController == null) {
      return;
    }
    changedByOutside = true;
    dayCanController!.select(value);
  }
}
