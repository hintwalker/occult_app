import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';

class HoriRequestWatchingYearWidget extends StatelessWidget {
  const HoriRequestWatchingYearWidget(
    this.value, {
    super.key,
    required this.translate,
  });
  final int value;
  final String Function(String) translate;

  String canName(Can can) => translate(can.name);
  String chiName(Chi chi) => translate(chi.name);

  @override
  Widget build(BuildContext context) {
    final can = Can.ofLuniYear(value);
    final chi = Chi.ofLuniYear(value);
    return Text(
      '$value ${canName(can)} ${chiName(chi)}',
      style: const TextStyle(fontSize: 12, letterSpacing: 1.2),
      overflow: TextOverflow.fade,
    );
  }
}
