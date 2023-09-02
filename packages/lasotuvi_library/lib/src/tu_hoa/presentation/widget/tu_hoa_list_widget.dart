import 'package:flutter/material.dart';
import 'package:lasotuvi_library/src/tu_hoa/presentation/state/tu_hoa_list_state.dart';
import 'package:lasotuvi_library/src/tu_hoa/presentation/style/tu_hoa_list_style.dart';
import 'package:lasotuvi_library/src/tu_hoa/presentation/widget/tu_hoa_list_item.dart';
import 'package:tauari_ui/tauari_ui.dart';

class TuHoaListWidget extends UniversalStatefulWidget {
  const TuHoaListWidget({
    super.key,
    required this.state,
    required super.translate,
    required this.style,
  });
  final TuHoaListState state;
  final TuHoaListStyle style;

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: state.data.length,
  //     itemBuilder: (context, index) => TuHoaListItem(
  //       data: state.data.elementAt(index),
  //       translate: translate,
  //       highlightColor: style.highlightColor,
  //       canColor: style.canColor,
  //     ),
  //   );
  // }

  @override
  State<StatefulWidget> createState() => _TuHoaListWidgetState();
}

class _TuHoaListWidgetState extends State<TuHoaListWidget> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.state.data.length,
      itemBuilder: (context, index) => TuHoaListItem(
        data: widget.state.data.elementAt(index),
        translate: widget.translate,
        highlightColor: widget.style.highlightColor,
        canColor: widget.style.canColor,
        selected: selectedIndex == index,
        selectedColor: widget.style.selectedColor,
        hoaLabelColor: widget.style.hoaLabel,
        selectedHoaLabelColor: widget.style.selectedHoaLabel,
        chipBorderColor: widget.style.chipBorderColor,
        chipBackgroundColor: widget.style.chipBackgroundColor,
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
