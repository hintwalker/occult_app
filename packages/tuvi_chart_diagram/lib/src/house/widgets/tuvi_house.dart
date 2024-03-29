import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import 'body/house_body_section.dart';
import 'bottom/house_bottom_section.dart';
import 'header/house_header_section.dart';

class TuviHouse extends StatelessWidget {
  const TuviHouse(
    this.data, {
    super.key,
    this.minorStarSizeGroup,
    this.majorStarSizeGroup,
    this.positionSizeGroup,
    required this.translate,
    required this.colorScheme,
  });
  final House data;
  final AutoSizeGroup? minorStarSizeGroup;
  final AutoSizeGroup? majorStarSizeGroup;
  final AutoSizeGroup? positionSizeGroup;
  final String Function(String) translate;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HouseHeaderSection(
          isThan: data.isThan,
          houseName: data.name,
          decade: data.lifeMilestone.decade,
          can: data.can,
          position: data.position,
          sizeGroup: positionSizeGroup,
          translate: translate,
          colorScheme: colorScheme,
        ),
        Expanded(
            child: HouseBodySection(
          majorStars: data.majorStars,
          minorStars: data.minorStars,
          minorStarSizeGroup: minorStarSizeGroup,
          majorStarSizeGroup: majorStarSizeGroup,
          translate: translate,
        )),
        HouseBottomSection(
          year: data.lifeMilestone.year,
          month: data.lifeMilestone.month,
          lifeStar: data.lifeStar,
          translate: translate,
        )
      ],
    );
  }
}
