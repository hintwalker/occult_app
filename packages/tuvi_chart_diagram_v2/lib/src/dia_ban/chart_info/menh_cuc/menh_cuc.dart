import 'package:flutter/material.dart';
import 'package:sunoom/sunoom.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../../../element_colors.dart';
import '../item_container.dart';
import '../item_text_style.dart';

class MenhCuc extends StatelessWidget {
  const MenhCuc({
    super.key,
    required this.humanBio,
    required this.banMenh,
    required this.cuc,
    required this.translate,
  });
  final HumanBio humanBio;
  final HoaGiap banMenh;
  final Cuc cuc;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    final menh = nguHanhOfYear(humanBio.birthDay.luniSolarDate.year);

    final rel = menh.compareToCuc(cuc);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemContainer(Text(
          translate(rel.name),
          style: itemTextStyle,
        )),
        const SizedBox(
          height: 4,
        ),
        Wrap(
          spacing: 2.0,
          children: [
            ItemContainer(
              Text(
                translate(banMenh.name),
                style: itemTextStyle.copyWith(
                    color: ElementColors.ofNguHanh(banMenh.nguHanh)),
              ),
            ),
            ItemContainer(
              Text(
                translate(cuc.name),
                style: itemTextStyle.copyWith(
                    color: ElementColors.ofNguHanh(cuc.nguHanh)),
              ),
            )
          ],
        )
      ],
    );
  }
}
