import 'package:flutter/material.dart';
import '../controllers/time_name_controller.dart';
import 'can_chi_group.dart';

class TimeNameGroup extends StatefulWidget {
  const TimeNameGroup({
    super.key,
    required this.controller,
    this.colorScheme,
    this.translate,
  });
  final TimeNameController controller;
  final ColorScheme? colorScheme;
  final String Function(String)? translate;

  @override
  State<TimeNameGroup> createState() => _TimeNameGroupState();
}

class _TimeNameGroupState extends State<TimeNameGroup> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listenToController);
  }

  void listenToController() => setState(() {});

  @override
  void dispose() {
    widget.controller.removeListener(listenToController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 56,
        ),
        Expanded(
          child: CanChiGroup(
            can: widget.controller.timeCan,
            chi: widget.controller.timeChi,
            colorScheme: widget.colorScheme,
            translate: widget.translate,
          ),
        )
      ],
    );
  }
}
