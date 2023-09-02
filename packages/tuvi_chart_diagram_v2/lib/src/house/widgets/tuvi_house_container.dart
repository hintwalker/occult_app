import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tauari_ui/tauari_ui.dart';
import 'package:tuvi_chart_diagram_v2/src/house/state/house_state.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

import '../../element_colors.dart';
import '../house_controller.dart';
import 'tuvi_house.dart';

class HouseContainer extends UniversalWidget {
  const HouseContainer({
    super.key,
    required super.translate,
    required this.state,
    required this.minorStarSizeGroup,
    required this.majorStarSizeGroup,
    this.positionSizeGroup,
    required this.onTap,
    required this.colorScheme,
  });
  final HouseState state;
  final AutoSizeGroup minorStarSizeGroup;
  final AutoSizeGroup majorStarSizeGroup;
  final AutoSizeGroup? positionSizeGroup;
  final void Function(House) onTap;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onTap(state.house),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: state.selected
                ? state.source
                    ? ElementColors.selectedAsSource
                    : ElementColors.selectedAsOther
                : colorScheme.background,
            border: Border.all(
              color: colorScheme.onBackground,
              width: 0.5,
            ),
          ),
          child: TuviHouse(
            state.house,
            minorStarSizeGroup: minorStarSizeGroup,
            majorStarSizeGroup: majorStarSizeGroup,
            translate: translate,
            positionSizeGroup: positionSizeGroup,
            colorScheme: colorScheme,
          ),
        ) //.applyConstraintId(id: widget.constraintId),
        );
  }
}

class TuviHouseContainer extends StatefulWidget {
  const TuviHouseContainer(
    this.data, {
    super.key,
    required this.minorStarSizeGroup,
    required this.majorStarSizeGroup,
    required this.translate,
    required this.controller,
    required this.colorScheme,
    this.positionSizeGroup,
  });
  final House data;
  final AutoSizeGroup minorStarSizeGroup;
  final AutoSizeGroup majorStarSizeGroup;
  final AutoSizeGroup? positionSizeGroup;
  final String Function(String) translate;
  final HouseController controller;
  final ColorScheme colorScheme;
  @override
  State<StatefulWidget> createState() => _TuviHouseContainerState();
}

class _TuviHouseContainerState extends State<TuviHouseContainer> {
  late Color containerColor;
  void onTap() {
    widget.controller.select(true, true);
  }

  void onChangedByOutside() {
    setState(() {
      if (widget.controller.selected) {
        if (widget.controller.source) {
          containerColor = ElementColors.selectedAsSource;
        } else {
          containerColor = ElementColors.selectedAsOther;
        }
      } else {
        containerColor = widget.colorScheme.background;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    containerColor = widget.colorScheme.background;
    widget.controller.addListener(onChangedByOutside);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onChangedByOutside);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(
              color: widget.colorScheme.onBackground,
              width: 0.5,
            ),
          ),
          child: TuviHouse(
            widget.data,
            minorStarSizeGroup: widget.minorStarSizeGroup,
            majorStarSizeGroup: widget.majorStarSizeGroup,
            translate: widget.translate,
            positionSizeGroup: widget.positionSizeGroup,
            colorScheme: widget.colorScheme,
          ),
        ) //.applyConstraintId(id: widget.constraintId),
        );
  }
}
