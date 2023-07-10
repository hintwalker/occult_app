import 'package:tuvi_domain/tuvi_domain.dart';

import 'form_field_controller.dart';

class GenderController extends FormFieldController<Gender> {
  GenderController({
    required super.value,
    required super.updateValid,
    required super.updateValue,
  });
}
