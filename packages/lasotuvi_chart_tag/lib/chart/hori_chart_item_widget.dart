part of lasotuvi_chart_tag;

class HoriChartItemWidget extends StatelessWidget {
  const HoriChartItemWidget(
    this.item, {
    super.key,
    this.uid,
    required this.translate,
    required this.colorScheme,
    required this.onSyncStatusTap,
    required this.onTap,
    // required this.storageOptionsModalBuilder,
  });
  final Chart item;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;
  final void Function() onSyncStatusTap;
  final void Function(BuildContext context, Chart chart) onTap;
  // final Widget Function(String chartId) chartView;
  // final Widget Function(Chart, {String? uid, String? syncStatus})
  //     storageOptionsModalBuilder;

  @override
  Widget build(BuildContext context) {
    final birthday =
        item.birthday.toMoment(TimeZone(offsetInHour: item.timeZoneOffset));
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Stack(children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap:
              // () => showGeneralDialog(
              //   context: context,
              //   pageBuilder: (context, animation, secondaryAnimation) =>
              //       chartView(item.docId),
              // ),
              () => onTap(context, item),
          child: Card(
            margin: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 4.0),
            child: Container(
              padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
              constraints:
                  const BoxConstraints(minWidth: 120.0, maxWidth: 120.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Expanded(
                  //   child: Center(
                  // child:
                  SizedBox(
                    width: 48.0,
                    height: 48.0,
                    child: CircleHumanAvatar(
                      gender: item.gender.intValue,
                      path: item.avatar,
                      size: 48.0,
                    ),
                  ),
                  //   ),
                  // ),

                  // const SizedBox(
                  //   height: 4.0,
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //           child: Divider(
                  //         height: 4.0,
                  //         thickness: 3.0,
                  //       ))
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: HoriChartNameWidget(item.name),
                  ),

                  const HoriChartDivider(),
                  const SizedBox(
                    height: 4.0,
                  ),
                  HoriChartBirthdayWidget(birthday, translate: translate),
                  const HoriChartDivider(),
                  HoriChartWatchingYearWidget(item.watchingYear,
                      translate: translate),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            child: SyncStatusRibbonWidget<Chart>(
          uid: uid,
          syncStatus: item.syncStatus,
          colorScheme: colorScheme,
          onTap: onSyncStatusTap,
        ))
      ]),
    );
  }

  // void openChartView({required BuildContext context,required String chartId, required String? uid}) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (_) {
  //         return SingleChildScrollView(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             mainAxisSize: MainAxisSize.min,
  //             children: [ChartViewBuilder(chartId: chartId, uid: uid)],
  //           ),
  //         );
  //       });
  // }
}
