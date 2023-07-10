import 'package:tuvi_domain/tuvi_domain.dart';

import 'form_field_controller.dart';

class ChartAvatarController extends FormFieldController<String?> {
  ChartAvatarController({
    required super.value,
    required super.updateValid,
    required super.updateValue,
    required this.initGender,
  });
  final Gender initGender;
}
