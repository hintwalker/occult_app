import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../controllers/can_chi_controller.dart';
import '../controllers/date_name_controller.dart';
import 'can_chi_field.dart';

class CanChiDateInput extends StatefulWidget {
  const CanChiDateInput(this.controller, {super.key});
  final CanChiController controller;

  @override
  State<StatefulWidget> createState() => _CanChiDateInputState();
}

class _CanChiDateInputState extends State<CanChiDateInput> {
  final _dayCanController = DateNameController<Cans>();
  final _dayChiController = DateNameController<Chies>();
  final _monthCanController = DateNameController<Cans>();
  final _monthChiController = DateNameController<Chies>();
  final _yearCanController = DateNameController<Cans>();
  final _yearChiController = DateNameController<Chies>();

  @override
  void initState() {
    super.initState();
    widget.controller.dayCanController = _dayCanController;
    widget.controller.dayChiController = _dayChiController;
    widget.controller.monthCanController = _monthCanController;
    widget.controller.monthChiController = _monthChiController;
    widget.controller.yearCanController = _yearCanController;
    widget.controller.yearChiController = _yearChiController;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CanChiField(
          canController: _dayCanController,
          chiController: _dayChiController,
        )),
        const SizedBox(width: 16),
        Expanded(
            child: CanChiField(
          canController: _monthCanController,
          chiController: _monthChiController,
        )),
        const SizedBox(width: 16),
        Expanded(
            child: CanChiField(
          canController: _yearCanController,
          chiController: _yearChiController,
        )),
      ],
    );
  }
}
