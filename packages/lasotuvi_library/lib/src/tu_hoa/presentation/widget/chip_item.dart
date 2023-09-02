import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChipItem extends UniversalWidget {
  const ChipItem(
    this.data, {
    super.key,
    required super.translate,
    required this.label,
    required this.highlight,
    this.highLightColor,
    this.hoaLabelColor,
    this.backgroundColor,
    required this.borderColor,
  });
  final String data;
  final String label;
  final bool highlight;
  final Color? highLightColor;
  final Color? hoaLabelColor;
  final Color borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
            decoration: BoxDecoration(
              color: highlight ? highLightColor : backgroundColor,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: borderColor),
            ),
            child: Text(
              translate(data),
              style: const TextStyle(fontSize: 14.0),
            )),
        // Chip(
        //   label: Text(
        //     translate(data),
        //     style: const TextStyle(fontSize: 14.0),
        //   ),
        //   labelPadding:
        //       const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        //   padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 0.0),
        //   backgroundColor: highlight ? highLightColor : null,
        // ),
        const SizedBox(
          height: 2.0,
        ),
        Text(
          translate(label),
          style: TextStyle(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              height: 1,
              color: hoaLabelColor),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
