import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

import '../controllers/date_name_group_controller.dart';
import 'can_chi_group.dart';

class DateNameGroup extends StatefulWidget {
  const DateNameGroup(
    this.controller, {
    super.key,
    this.colorScheme,
  });
  final DateNameGroupController controller;
  final ColorScheme? colorScheme;

  @override
  State<StatefulWidget> createState() => _DateNameGroupState();
}

class _DateNameGroupState extends State<DateNameGroup> {
  Cans? dayCan;
  Chies? dayChi;
  Cans? monthCan;
  Chies? monthChi;
  Cans? yearCan;
  Chies? yearChi;
  @override
  void initState() {
    super.initState();
    listener();
    widget.controller.addListener(listener);
  }

  void listener() {
    setState(() {
      dayCan = widget.controller.dayCan;
      dayChi = widget.controller.dayChi;

      monthCan = widget.controller.monthCan;
      monthChi = widget.controller.monthChi;

      yearCan = widget.controller.yearCan;
      yearChi = widget.controller.yearChi;
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: CanChiGroup(
          can: dayCan,
          chi: dayChi,
          colorScheme: widget.colorScheme,
        )),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: CanChiGroup(
          can: monthCan,
          chi: monthChi,
          colorScheme: widget.colorScheme,
        )),
        const SizedBox(
          width: 16,
        ),
        Expanded(
            child: CanChiGroup(
          can: yearCan,
          chi: yearChi,
          colorScheme: widget.colorScheme,
        )),
      ],
    );
  }
}
