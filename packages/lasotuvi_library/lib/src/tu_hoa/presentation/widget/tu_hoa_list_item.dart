import 'package:flutter/material.dart';
import 'package:lasotuvi_library/src/tu_hoa/domain/entity/tu_hoa.dart';
import 'package:lasotuvi_library/src/tu_hoa/presentation/widget/chip_item.dart';
import 'package:tauari_ui/tauari_ui.dart';

class TuHoaListItem extends UniversalWidget {
  const TuHoaListItem({
    super.key,
    required this.data,
    required super.translate,
    this.highlightColor,
    this.canColor,
    required this.selected,
    required this.onTap,
    this.selectedColor,
    this.hoaLabelColor,
    this.selectedHoaLabelColor,
    this.chipBackgroundColor,
    required this.chipBorderColor,
  });
  final TuHoa data;
  final Color? highlightColor;
  final Color? canColor;
  final bool selected;
  final void Function() onTap;
  final Color? selectedColor;
  final Color? hoaLabelColor;
  final Color? selectedHoaLabelColor;
  final Color chipBorderColor;
  final Color? chipBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selected ? selectedColor : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
          child: Row(children: [
            SizedBox(
              width: 40.0,
              child: Text(
                translate(data.can),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: canColor,
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            // contentPadding:
            //     const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ChipItem(
                      data.loc,
                      translate: translate,
                      label: 'loc',
                      highlight: false,
                      hoaLabelColor:
                          selected ? selectedHoaLabelColor : hoaLabelColor,
                      borderColor: chipBorderColor,
                      backgroundColor: chipBackgroundColor,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    ChipItem(
                      data.quyen,
                      translate: translate,
                      label: 'quyen',
                      highlight: false,
                      hoaLabelColor:
                          selected ? selectedHoaLabelColor : hoaLabelColor,
                      borderColor: chipBorderColor,
                      backgroundColor: chipBackgroundColor,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    ChipItem(
                      data.khoa,
                      translate: translate,
                      label: 'khoa',
                      highLightColor: highlightColor,
                      highlight: data.diff.contains('khoa'),
                      hoaLabelColor:
                          selected ? selectedHoaLabelColor : hoaLabelColor,
                      borderColor: chipBorderColor,
                      backgroundColor: chipBackgroundColor,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    ChipItem(
                      data.ki,
                      translate: translate,
                      label: 'ki',
                      highLightColor: highlightColor,
                      highlight: data.diff.contains('ki'),
                      hoaLabelColor:
                          selected ? selectedHoaLabelColor : hoaLabelColor,
                      borderColor: chipBorderColor,
                      backgroundColor: chipBackgroundColor,
                    ),
                    // Chip(
                    //   label: Text(
                    //     translate(data.loc),
                    //   ),
                    //   labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    //   padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    // ),
                    // const SizedBox(
                    //   width: 4.0,
                    // ),
                    // Chip(
                    //   label: Text(translate(data.quyen)),
                    //   labelPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    //   padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    // ),
                    // const SizedBox(
                    //   width: 4.0,
                    // ),
                    // Chip(
                    //   label: Text(translate(data.khoa)),
                    //   labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    //   padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    // ),
                    // const SizedBox(
                    //   width: 4.0,
                    // ),
                    // Chip(
                    //   label: Text(translate(data.ki)),
                    //   labelPadding: const EdgeInsets.symmetric(horizontal: 0.0),
                    //   padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    // ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
