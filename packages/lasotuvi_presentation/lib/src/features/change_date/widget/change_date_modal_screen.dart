import 'package:flutter/material.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:sunoom/sunoom.dart';
import 'package:sunoom_calendar_input/sunoom_calendar_input.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChangeDateModalScreen extends StatelessWidget {
  const ChangeDateModalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicDialog(title: translate('changeDate'), children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 24.0,
        ),
        child: CalendarInput(
          colorScheme: LasotuviAppStyle.colorScheme,
          translate: translate,
          onDateChanged: (_, {required valid}) {},
          // onValidate: (valid) =>
          //     ref.read(chartCreationNotifierProvider.notifier).updateValid(valid),
          initValue: Moment.now(),
        ),
      ),
    ]);
  }
}
