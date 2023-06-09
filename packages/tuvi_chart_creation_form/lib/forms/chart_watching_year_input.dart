import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../chart_creation_notifier.dart';

class ChartWatchingYearInput extends ConsumerStatefulWidget {
  const ChartWatchingYearInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartWatchingYearInputState();
}

class _ChartWatchingYearInputState
    extends ConsumerState<ChartWatchingYearInput> {
  final _formKey = GlobalKey<FormState>();
  late int initValue = 2023;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        initValue = ref.read(chartCreationNotifierProvider).watchingYear;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        initialValue: '$initValue',
        inputFormatters: [LengthLimitingTextInputFormatter(4)],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.datetime,
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
                .updateWatchingYear(value);
          }
        },
      ),
    );
  }
}
