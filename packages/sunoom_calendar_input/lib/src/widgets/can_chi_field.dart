import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../controllers/date_name_controller.dart';
import '../validators/can_chi_validator.dart';
import 'date_name_field.dart';

class CanChiField extends StatefulWidget {
  const CanChiField({
    super.key,
    required this.canController,
    required this.chiController,
    this.colorScheme,
  });
  final DateNameController<Cans> canController;
  final DateNameController<Chies> chiController;
  final ColorScheme? colorScheme;

  @override
  State<StatefulWidget> createState() => _CanChiFieldState();
}

class _CanChiFieldState extends State<CanChiField> {
  final CanChiValidator validator = CanChiValidator();
  String? error;
  @override
  void initState() {
    super.initState();
    widget.canController.addListener(controllerListener);
    widget.chiController.addListener(controllerListener);
  }

  void controllerListener() {
    final error = validator.validate(
        widget.canController.selected!, widget.chiController.selected!);
    setState(() {
      this.error = error;
    });
  }

  void chiControllerListener() {}
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        DateNameField<Cans>(
          widget.canController,
          defaultValue: Cans.giap,
          data: Cans.values,
        ),
        DateNameField<Chies>(
          widget.chiController,
          defaultValue: Chies.tys,
          data: Chies.values,
        ),
        if (error != null)
          Text(
            error!,
            style: TextStyle(
              color: widget.colorScheme != null
                  ? widget.colorScheme!.error
                  : Colors.red,
            ),
          )
      ],
    );
  }
}
