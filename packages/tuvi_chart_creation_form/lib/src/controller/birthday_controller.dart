import 'package:sunoom/sunoom.dart';

import 'form_field_controller.dart';

class BirthdayController extends FormFieldController<Moment?> {
  BirthdayController({
    required super.value,
    required super.updateValid,
    required super.updateValue,
  });
}
