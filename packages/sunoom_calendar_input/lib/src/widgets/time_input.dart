import 'package:flutter/material.dart';

import '../controllers/time_controller.dart';
import 'date_field.dart';

class TimeInput extends StatefulWidget {
  const TimeInput(this.controller, {super.key});
  final TimeController controller;
  // final GregorianDateController gregorianDateController;

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
    _initData();
  }

  void _initData() {
    _hourController.text = widget.controller.hour?.toString() ?? '';
    _minuteController.text = widget.controller.minute?.toString() ?? '';
    widget.controller.hourController = _hourController;
    widget.controller.minuteController = _minuteController;
  }

  // @override
  // void didUpdateWidget(covariant TimeInput oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   _initData();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 48.0,
              child: Icon(Icons.access_time),
            ),
            const SizedBox(
              width: 8.0,
            ),
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
              width: 32,
              child: Text(
                ':',
                textAlign: TextAlign.center,
              ),
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
