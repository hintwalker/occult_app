part of lasotuvi_chart;

class HoriChartItemWidget extends StatelessWidget {
  const HoriChartItemWidget(
    this.item, {
    super.key,
    this.uid,
    required this.translate,
    required this.colorScheme,
  });
  final Chart item;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    final birthday =
        item.birthday.toMoment(TimeZone(offsetInHour: item.timeZoneOffset));
    return Stack(children: [
      Card(
          margin: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, top: 12.0, right: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Center(
                      child: SizedBox(
                          width: 48.0,
                          height: 48.0,
                          child: CircleHumanAvatar(
                            gender: item.gender.intValue,
                            path: item.avatar,
                            size: 48.0,
                          ))),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                HoriChartNameWidget(item.name),
                const SizedBox(
                  height: 4.0,
                ),
                HoriChartBirthdayWidget(birthday, translate: translate)
              ],
            ),
          )),
      Positioned(
          child: SyncStatusRibbonWidget(
              uid: uid, syncStatus: item.syncStatus, colorScheme: colorScheme))
    ]);
  }
}
