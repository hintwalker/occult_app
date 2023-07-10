import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../item_container.dart';
import '../item_text_style.dart';

class HumanAmDuong extends StatelessWidget {
  const HumanAmDuong({
    super.key,
    required this.translate,
    required this.posOfMenh,
    required this.bornYear,
  });
  final String Function(String) translate;
  final int posOfMenh;
  final int bornYear;

  @override
  Widget build(BuildContext context) {
    final chiOfBornYear = Chi.ofLuniYear(bornYear);
    final rel = findAmDuongRel(posOfMenh, chiOfBornYear);
    return ItemContainer(Text(
      translate(rel.name),
      style: itemTextStyle,
    ));
  }
}
