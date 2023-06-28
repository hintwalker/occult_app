part of lasotuvi_chart;

class ChartHasTagsListItem extends StatelessWidget {
  const ChartHasTagsListItem(
    this.data, {
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onTap,
    this.uid,
    required this.onSyncStatusTap,
  });
  final ChartHasTags data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Chart, String? uid) onTap;
  final String? uid;
  final void Function() onSyncStatusTap;
  // final Widget Function(Chart, {String? uid, String? onCloud})
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    // final birthday = data.source.birthday
    //     .toMoment(TimeZone(offsetInHour: data.source.timeZoneOffset));
    // final now = DateTime.now();
    // final yearsOld = yearOld(
    //     birthday: birthday,
    //     now: now.toMoment(TimeZone(offsetInHour: now.timeZoneOffset.inHours)));
    // final yearsOldFromWatchingYear = yearOld(
    //     birthday: birthday,
    //     now: DateTime(data.source.watchingYear)
    //         .toMoment(TimeZone(offsetInHour: now.timeZoneOffset.inHours)));
    return ListItemHasStorageIcon<Chart>(
        uid: uid,
        syncStatus: data.source.getSyncStatus,
        syncData: data.source,
        colorScheme: colorScheme,
        onSyncStatusTap: onSyncStatusTap,
        child: ChartItemCardWidget(data.source,
            colorScheme: colorScheme,
            translate: translate,
            onTap: onTap,
            tags: data.carry)
        // Card(
        //   child: ListTile(
        //     onTap: () => onTap(context, data.source, uid),
        //     leading: Column(
        //       children: [
        //         Expanded(
        //             child: SizedBox(
        //                 width: 48.0,
        //                 height: 48.0,
        //                 child: CircleHumanAvatar(
        //                   gender: data.source.gender.intValue,
        //                   path: data.source.avatar,
        //                   size: 48.0,
        //                 ))),
        //         Text(
        //           '$yearsOld',
        //           style: const TextStyle(
        //               fontSize: 11, fontStyle: FontStyle.italic),
        //         )
        //       ],
        //     ),
        //     title: Text(data.source.name),
        //     subtitle:
        //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //       Text(
        //         birthday.toString(),
        //         style: const TextStyle(fontSize: 11),
        //       ),
        //       Row(
        //         children: [
        //           Text('${translate('watchingYear')}: '),
        //           Text('${data.source.watchingYear}'),
        //           const SizedBox(
        //             width: 8.0,
        //           ),
        //           Text(
        //               '($yearsOldFromWatchingYear ${translate('yearsOldSuffix')})')
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Text(
        //             '${translate("created")}: ${data.source.created.toStringVn()}',
        //             style: TextStyle(
        //                 fontSize: 10,
        //                 fontStyle: FontStyle.italic,
        //                 color: colorScheme.outline),
        //           )
        //         ],
        //       ),
        //       Wrap(
        //         spacing: 2.0,
        //         runSpacing: 2.0,
        //         children: [
        //           for (var tag in data.carry) TagItemInChart(tag.title)
        //         ],
        //       )
        //     ]),
        //     // trailing: IconButton(
        //     //     onPressed: () => onTap(data.source, uid),
        //     //     icon: const Icon(Icons.keyboard_arrow_right)),
        //   ),
        // )
        );
  }
}
