import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'house_major_stars_section.dart';
import 'house_minor_stars_section.dart';

class HouseBodySection extends StatelessWidget {
  const HouseBodySection({
    super.key,
    required this.majorStars,
    required this.minorStars,
    required this.minorStarSizeGroup,
    required this.majorStarSizeGroup,
    required this.translate,
  });
  final Iterable<Star> majorStars;
  final Iterable<Star> minorStars;
  final AutoSizeGroup? minorStarSizeGroup;
  final AutoSizeGroup? majorStarSizeGroup;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HouseMajorStarsSection(
          majorStars,
          autoSizeGroup: majorStarSizeGroup,
          translate: translate,
        ),
        const SizedBox(
          height: 4.0,
        ),
        Expanded(
            child: HouseMinorStarsSection(
          goodStars: minorStars.where((element) => element.info.isGood),
          badStars: minorStars.where((element) => !element.info.isGood),
          autoSizeGroup: minorStarSizeGroup,
          translate: translate,
        ))
      ],
    );
  }
}
