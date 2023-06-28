part of lasotuvi_chart;

class ChartViewWidget extends StatelessWidget {
  const ChartViewWidget(
    this.chartHasTags, {
    super.key,
    this.uid,
    required this.controller,
    required this.translate,
    required this.onGoToDetail,
    required this.colorScheme,
    required this.chartSyncOptions,
    required this.noteSyncOptions,
    required this.tagSyncOptions,
  });
  final String? uid;
  final ChartHasTags chartHasTags;
  final ChartViewController controller;
  final ColorScheme colorScheme;
  final Widget Function(Chart, {String? uid, String? syncStatus})
      chartSyncOptions;
  final Widget Function(Note, {String? uid, String? syncStatus})
      noteSyncOptions;
  final Widget Function(Tag, {String? uid, String? syncStatus}) tagSyncOptions;

  final String Function(String) translate;
  final void Function(BuildContext context, Chart chart) onGoToDetail;

  // String canName(Can can) => translate(can.name);
  // String chiName(Chi chi) => translate(chi.name);

  @override
  Widget build(BuildContext context) {
    // final birthday = chartHasTags.source.birthday
    //     .toMoment(TimeZone(offsetInHour: chartHasTags.source.timeZoneOffset));
    // final humanBio = HumanBio(
    //     name: chartHasTags.source.name,
    //     gender: chartHasTags.source.gender,
    //     birthDay: birthday,
    //     watchingYear: chartHasTags.source.watchingYear);
    // // final chiOfBornYear = Chi.ofLuniYear(birthday.luniSolarDate.year);
    // // final canOfBornYear = Can.ofLuniYear(birthday.luniSolarDate.year);

    // final canDay = Can.ofDay(birthday);
    // final chiDay =
    //     Chi.ofGregorianDay(date: birthday.gregorian, time: birthday.time);
    // final canMonth = Can.ofLuniMonth(
    //     year: birthday.luniSolarDate.year, month: birthday.luniSolarDate.month);
    // final chiMonth = Chi.ofLuniMonth(birthday.luniSolarDate.month);

    // final canTime = Can.ofTime(canOfDay: canDay, time: birthday.time);
    // final chiTime = Chi.ofTime(birthday.time);
    // // final canChiOfBornYear =
    // //     '${translate(canOfBornYear.name)} ${translate(chiOfBornYear.name)}';
    // final canChiMonth =
    //     '${translate(canMonth.name)} ${translate(chiMonth.name)}';
    // final canChiDay = '${translate(canDay.name)} ${translate(chiDay.name)}';
    // final canChiTime = '${translate(canTime.name)} ${translate(chiTime.name)}';
    // final canWatching = Can.ofLuniYear(chartHasTags.source.watchingYear);
    // final chiWatching = Chi.ofLuniYear(chartHasTags.source.watchingYear);
    // final canChiWatching =
    //     '${translate(canWatching.name)} ${translate(chiWatching.name)}';
    // final yearOldInt = yearOld(
    //     birthday: birthday,
    //     now: DateTime(chartHasTags.source.watchingYear)
    //         .toMoment(birthday.timeZone));
    // final yearOldText = '$yearOldInt ${translate("tuoi")}';
    return Stack(
      fit: StackFit.expand,
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ChartViewBioWidget(
                        chartHasTags.source,
                        translate: translate,
                      ),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    // const Spacer(),
                    Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ChartViewAvatarWidget(
                              chartHasTags.source,
                              uid: uid,
                              colorScheme: colorScheme,
                              openSyncOptions: openChartSyncOptions,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.edit),
                              label: Text(
                                translate('changeInfo'),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(children: [
                  Text(
                    '${translate('tag')} (${chartHasTags.carry.length})',
                    style:
                        TextStyle(fontSize: 22.0, color: colorScheme.primary),
                  ),
                  const SizedBox(width: 12.0),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline),
                    label: Text(
                      translate('addTag'),
                    ),
                  ),
                ]),
                Wrap(
                  spacing: 2.0,
                  runSpacing: 2.0,
                  children: chartHasTags.carry
                      .map(
                        (e) => Card(child: Text(e.title)),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                ChartViewNoteGridBuilder(
                  uid: uid,
                  colorScheme: colorScheme,
                  translate: translate,
                  notes: () =>
                      controller.noteStream(uid, chartHasTags.source.id),
                  openSyncOptions: openNoteSyncOptions,
                ),
                const SizedBox(
                  height: 192.0,
                ),
                const Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
                const SizedBox(
                  height: 2.0,
                ),
                const Divider(
                  height: 1.0,
                  thickness: 1.0,
                ),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 24.0,
            right: 12.0,
            left: 12.0,
            child: Row(
              children: [
                FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: colorScheme.tertiary),
                    onPressed: () {},
                    child: Text(translate('sendCommentaryRequest'),
                        style: TextStyle(
                          color: colorScheme.onTertiary,
                        ))),
                const Spacer(),
                FilledButton(
                  onPressed: () => onGoToDetail(context, chartHasTags.source),
                  child: Text(
                    translate('watchChartDetail'),
                  ),
                ),
              ],
            ))
      ],
    );
  }

  void openChartSyncOptions(BuildContext context, Chart item) {
    showModalBottomSheet(
        context: context,
        builder: (_) =>
            chartSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  }

  void openNoteSyncOptions(BuildContext context, Note item) {
    showModalBottomSheet(
        context: context,
        builder: (_) =>
            noteSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  }

  void openTagSyncOptions(BuildContext context, Tag item) {
    showModalBottomSheet(
        context: context,
        builder: (_) =>
            tagSyncOptions(item, syncStatus: item.syncStatus, uid: uid));
  }
}
