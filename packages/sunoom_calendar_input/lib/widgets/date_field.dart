part of sunoom_calendar_input;

class DateField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?) validator;
  final void Function(String?) onChanged;
  final int maxLength;
  // final FormState? formState;
  const DateField({
    // this.formState,
    required this.maxLength,
    required this.textEditingController,
    required this.validator,
    required this.onChanged,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
        FilteringTextInputFormatter.digitsOnly
      ],
      onChanged: (value) => onChanged(value),
      onTap: () => textEditingController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: textEditingController.value.text.length,
      ),
    );
  }
}
