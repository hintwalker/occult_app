import 'package:flutter/material.dart';

import '../style/expired_timer_style.dart';

class CanceledWidget extends StatelessWidget {
  const CanceledWidget({
    super.key,
    required this.style,
    required this.translate,
  });
  final ExpiredTimerStyle style;
  final String Function(String) translate;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: style.canceledBackground,
          borderRadius: BorderRadius.circular(18.0)),
      child: Text(translate('canceled'),
          style: TextStyle(color: style.canceledTextColor)),
    );
  }
}
