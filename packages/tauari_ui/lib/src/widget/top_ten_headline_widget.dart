import 'package:flutter/material.dart';

// import '../controller/count_everywhere_controller.dart';
// import 'builder/basic_stream_builder.dart';
import 'top_ten_add_data_button.dart';
import 'top_ten_show_all_button.dart';
import 'top_ten_title_widget.dart';

class TopTenHeadlineWidget extends StatelessWidget {
  const TopTenHeadlineWidget(
    this.title, {
    super.key,
    required this.uid,
    required this.colorScheme,
    required this.onAddData,
    required this.onShowAll,
    required this.showAllText,
    this.dataCount,
    // required this.countStream,
    // required this.countEveryWhereController,
  });

  final String? uid;
  final String title;
  // final Stream<int> countStream;
  final ColorScheme colorScheme;
  final void Function()? onAddData;
  final void Function() onShowAll;
  final String showAllText;
  final Widget? dataCount;
  // final CountEveryWhereController countEveryWhereController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TopTenTitleWidget(title, colorScheme: colorScheme),
        const SizedBox(
          width: 4.0,
        ),
        if (dataCount != null) dataCount!,
        // BasicStreamBuilder(
        //   stream: countEveryWhereController.stream(uid),
        //   child: (count) => Text('($count)'),
        // ),
        const SizedBox(
          width: 12.0,
        ),
        if (onAddData != null)
          TopTenAddDataButton(
            colorScheme: colorScheme,
            onTap: onAddData!,
          ),
        const Spacer(),
        TopTenShowAllButton(
          showAllText,
          onTap: onShowAll,
          colorScheme: colorScheme,
        )
      ],
    );
  }
}
