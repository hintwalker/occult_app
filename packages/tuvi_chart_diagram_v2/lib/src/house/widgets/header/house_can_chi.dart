import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import '../../../element_colors.dart';

class HouseCanChi extends StatelessWidget {
  final Can can;
  final Chi chi;
  final NguHanh nguHanh;
  final AutoSizeGroup? sizeGroup;
  final String Function(String) translate;

  const HouseCanChi({
    super.key,
    required this.can,
    required this.chi,
    required this.nguHanh,
    required this.translate,
    this.sizeGroup,
  });
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      '${can.short}.${translate(chi.name)}',
      group: sizeGroup,
      // translate: translate,
      style: TextStyle(
          fontSize: 7,
          fontWeight: FontWeight.w600,
          color: ElementColors.ofNguHanh(nguHanh)),
      minFontSize: 7,
    );
  }
}
