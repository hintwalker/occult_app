import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tauari_ui/tauari_ui.dart';

class WatchingYear extends UniversalWidget {
  const WatchingYear(
    this.value, {
    super.key,
    required super.translate,
    this.style = const TextStyle(fontSize: 12, letterSpacing: 1.2),
  });
  final int value;
  final TextStyle? style;

  String canName(Can can) => translate(can.name);
  String chiName(Chi chi) => translate(chi.name);

  @override
  Widget build(BuildContext context) {
    final can = Can.ofLuniYear(value);
    final chi = Chi.ofLuniYear(value);
    return Text(
      '$value ${canName(can)} ${chiName(chi)}',
      style: style,
      overflow: TextOverflow.fade,
      maxLines: 1,
    );
  }
}
