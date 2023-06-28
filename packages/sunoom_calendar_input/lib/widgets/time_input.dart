part of sunoom_calendar_input;

class TimeInput extends StatefulWidget {
  const TimeInput(this.controller, {super.key});
  final TimeController controller;

  @override
  State<StatefulWidget> createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  final _formKey = GlobalKey<FormState>();
  final _hourController = TextEditingController();
  final _minuteController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _hourController.text = widget.controller.hour?.toString() ?? '';
    _minuteController.text = widget.controller.minute?.toString() ?? '';
    widget.controller.hourController = _hourController;
    widget.controller.minuteController = _minuteController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: DateField(
              onChanged: (value) =>
                  widget.controller.updateHour(value, _formKey.currentState),
              validator: widget.controller.validateHour,
              textEditingController: _hourController,
              maxLength: 2,
              // formState: _formKey.currentState,
            )),
            const SizedBox(
              width: 16,
              child: Text(':'),
            ),
            Expanded(
                child: DateField(
              onChanged: (value) =>
                  widget.controller.updateMinute(value, _formKey.currentState),
              validator: widget.controller.validateMinute,
              textEditingController: _minuteController,
              maxLength: 2,
              // formState: _formKey.currentState,
            )),
          ],
        ),
      ),
    );
  }
}
