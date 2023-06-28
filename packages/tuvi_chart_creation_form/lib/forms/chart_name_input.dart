part of tuvi_chart_creation_form;

class ChartNameInput extends ConsumerStatefulWidget {
  const ChartNameInput({super.key, required this.translate});
  final String Function(String) translate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChartNameInputState();
}

class _ChartNameInputState extends ConsumerState<ChartNameInput> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: TextFormField(
          decoration:
              InputDecoration(labelText: widget.translate('tenDuongSo')),
          inputFormatters: [LengthLimitingTextInputFormatter(30)],
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '!';
            }
            return null;
          },
          onChanged: (value) {
            if (_formKey.currentState!.validate()) {
              ref
                  .read(chartCreationNotifierProvider.notifier)
                  .updateName(value);
            }
          },
          onTap: () => controller.selection = TextSelection(
                baseOffset: 0,
                extentOffset: controller.value.text.length,
              )),
    );
  }
}
