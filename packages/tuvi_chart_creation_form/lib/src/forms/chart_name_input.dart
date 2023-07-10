import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/chart_name_controller.dart';

class ChartNameInput extends ConsumerStatefulWidget {
  const ChartNameInput({
    super.key,
    required this.translate,
    required this.controller,
  });
  final String Function(String) translate;
  final ChartNameController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChartNameInputState();
}

class _ChartNameInputState extends ConsumerState<ChartNameInput> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.controller.value);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: widget.translate('tenDuongSo')),
        inputFormatters: [LengthLimitingTextInputFormatter(30)],
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '!';
          }
          return null;
        },
        onChanged: (value) {
          widget.controller.onChanged(value, _formKey.currentState!.validate());
          // ref
          //     .read(chartCreationNotifierProvider.notifier)
          //     .updateValid(_formKey.currentState!.validate());
          // if (_formKey.currentState!.validate()) {
          //   ref
          //       .read(chartCreationNotifierProvider.notifier)
          //       .updateName(value);
          // }
        },
        // onTap: () => controller.selection = TextSelection(
        //       baseOffset: 0,
        //       extentOffset: controller.value.text.length,
        //     ),
      ),
    );
  }
}
