import 'package:flutter/material.dart';

import '../controllers/date_controller.dart';
import 'date_field.dart';

class DateInput extends StatefulWidget {
  final DateController controller;
  // final void Function(bool) onValidateWhenChange;
  const DateInput(
    this.controller, {
    super.key,
    // required this.onValidateWhenChange,
  });

  @override
  State<StatefulWidget> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  final _formKey = GlobalKey<FormState>();
  final _dayController = TextEditingController();
  final _monthController = TextEditingController();
  final _yearController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _dayController.text = widget.controller.day?.toString() ?? '';
    _monthController.text = widget.controller.month?.toString() ?? '';
    _yearController.text = widget.controller.year?.toString() ?? '';
    widget.controller.dayController = _dayController;
    widget.controller.monthController = _monthController;
    widget.controller.yearController = _yearController;
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
                    onChanged: (value) {
                      widget.controller.updateDay(value, _formKey.currentState);
                    },
                    validator: widget.controller.validateDay,
                    textEditingController: _dayController,
                    maxLength: 2,
                    // formState: _formKey.currentState,
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: DateField(
                    onChanged: (value) => widget.controller
                        .updateMonth(value, _formKey.currentState),
                    validator: widget.controller.validateMonth,
                    textEditingController: _monthController,
                    maxLength: 2,
                    // formState: _formKey.currentState,
                  )),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      child: DateField(
                    onChanged: (value) => widget.controller
                        .updateYear(value, _formKey.currentState),
                    validator: widget.controller.validateYear,
                    textEditingController: _yearController,
                    maxLength: 4,
                    // formState: _formKey.currentState,
                  )),
                ])));
  }
}
