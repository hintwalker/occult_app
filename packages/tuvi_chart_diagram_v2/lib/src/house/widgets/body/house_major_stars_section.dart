import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'major_star_item.dart';

class HouseMajorStarsSection extends StatelessWidget {
  const HouseMajorStarsSection(this.data,
      {super.key, this.autoSizeGroup, required this.translate});
  final Iterable<Star> data;
  final AutoSizeGroup? autoSizeGroup;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        data.isEmpty
            ? const Text(
                '',
                style: TextStyle(height: 1),
              )
            : MajorStarItem(data.first, translate: translate)
        // AutoSizeTranslatedText(
        //     data.first.name.name,
        //     style: const TextStyle(height: 1),
        //     autoSizeGroup: autoSizeGroup,
        //     translate: translate,
        //   )
        ,
        data.isEmpty
            ? const Text(
                '',
                style: TextStyle(height: 1),
              )
            : data.length == 1
                ? const Text(
                    '',
                    style: TextStyle(height: 1),
                  )
                : MajorStarItem(data.last, translate: translate)
        // AutoSizeTranslatedText(
        //     data.last.name.name,
        //     style: const TextStyle(height: 1),
        //     autoSizeGroup: autoSizeGroup,
        //     translate: translate,
        //   )
        ,
      ],
    );
  }
}
