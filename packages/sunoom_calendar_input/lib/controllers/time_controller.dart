part of sunoom_calendar_input;

class TimeController extends ChangeNotifier {
  int? hour;
  int? minute;
  FormState? state;
  TextEditingController? hourController;
  TextEditingController? minuteController;
  final HourValidator hourValidator;
  final MinuteValidator minuteValidator;

  TimeController(this.hour, this.minute,
      {required this.hourValidator, required this.minuteValidator});

  void setHour(int? value) {
    hour = value;
    if (hourController == null) {
      return;
    }
    if (value == null) {
      hourController!.text = '';
    } else {
      hourController!.text = '$value';
      hourController!.selection =
          TextSelection.collapsed(offset: value.toString().length);
    }
  }

  void setMinute(int? value) {
    minute = value;
    if (minuteController == null) {
      return;
    }
    if (value == null) {
      minuteController!.text = '';
    } else {
      minuteController!.text = '$value';
      minuteController!.selection =
          TextSelection.collapsed(offset: value.toString().length);
    }
  }

  void updateHour(String? value, FormState? state) {
    if (value == null || value.isEmpty) {
      hour = null;
    } else {
      hour = int.parse(value);
    }
    this.state = state;
    notifyListeners();
  }

  void updateMinute(String? value, FormState? state) {
    if (value == null || value.isEmpty) {
      minute = null;
    } else {
      minute = int.parse(value);
    }
    this.state = state;
    notifyListeners();
  }

  String? validateHour(String? value) => hourValidator.validate(value);

  String? validateMinute(String? value) => minuteValidator.validate(value);
}
