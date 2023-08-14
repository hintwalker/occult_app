import 'package:flutter/material.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:sunoom/sunoom.dart';
import 'package:sunoom_calendar_input/sunoom_calendar_input.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChangeDateModalScreen extends StatefulWidget {
  const ChangeDateModalScreen({super.key});

  @override
  State<StatefulWidget> createState() => ChangeDateModalScreenState();
}

class ChangeDateModalScreenState extends State<ChangeDateModalScreen> {
  late Moment now;
  @override
  void initState() {
    super.initState();
    now = Moment.now();
  }

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
          initValue: now,
        ),
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     TextButton(
      //       onPressed: () {
      //         Navigator.popAndPushNamed(context, RouteName.changeDate);
      //         // setState(() {
      //         //   now = Moment.now();
      //         // });
      //       },
      //       child: Text(
      //         translate('now'),
      //       ),
      //     ),
      //   ],
      // ),
    ]);
  }
}
