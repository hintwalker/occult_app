part of tuvi_chart_creation_form;

class ChartAvatarController extends FormFieldController<String?> {
  ChartAvatarController({
    required super.value,
    required super.updateValid,
    required super.updateValue,
    required this.initGender,
  });
  final Gender initGender;
}
