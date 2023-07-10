import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'item_container.dart';
import 'item_text_style.dart';

class HumanGender extends StatelessWidget {
  const HumanGender(this.data, {super.key, required this.translate});
  final DuongNamAmNu data;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ItemContainer(
      Text(translate(data.name), style: itemTextStyle),
    );
  }
}
