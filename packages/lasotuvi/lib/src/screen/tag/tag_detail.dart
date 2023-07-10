
// class TagDetailScreen extends StatelessWidget {
//   const TagDetailScreen({
//     super.key,
//     this.restorationId,
//     required this.tagId,
//   });
//   final String? restorationId;
//   final String tagId;

//   @override
//   Widget build(BuildContext context) {
//     return RestorableStatelessWidget(
//         restorationId: restorationId,
//         // child: ChartDetailBody(chartId: chartId),
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(translate('tag'),
//                 style: const TextStyle(
//                     fontSize: 20.0, fontStyle: FontStyle.normal)),
//             titleSpacing: 0,
//             // titleTextStyle: const TextStyle(
//             //   fontSize: 20.0,
//             //   fontStyle: FontStyle.normal,
//             // ),
//           ),
//           body: TagDetailBody(tagId: tagId),
//         ));
//   }
// }
