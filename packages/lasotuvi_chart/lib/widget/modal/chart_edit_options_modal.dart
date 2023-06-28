part of lasotuvi_chart;

class ChartEditOptionsModal extends StatelessWidget {
  const ChartEditOptionsModal(
    this.chart, {
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onOpenChangeAvatar,
    required this.onOpenChangeName,
    required this.onOpenChangeGender,
    required this.onOpenChangeBirthday,
    required this.onOpenChangeWatchingYear,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Chart chart;
  final void Function(Chart) onOpenChangeAvatar;
  final void Function(Chart) onOpenChangeName;
  final void Function(Chart) onOpenChangeGender;
  final void Function(Chart) onOpenChangeBirthday;
  final void Function(Chart) onOpenChangeWatchingYear;

  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
      title: translate('changeInfo'),
      colorScheme: colorScheme,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  leading: const Icon(Icons.account_box_outlined),
                  title: Text(translate('changeAvatar')),
                  onTap: () => onOpenChangeAvatar(chart),
                ),
                ListTile(
                  leading: const Icon(Icons.text_fields),
                  title: Text(translate('changeName')),
                  onTap: () => onOpenChangeName(chart),
                ),
                ListTile(
                  leading: const Icon(Icons.transgender),
                  title: Text(translate('changeGender')),
                  onTap: () => onOpenChangeGender(chart),
                ),
                ListTile(
                  leading: const Icon(Icons.today_outlined),
                  title: Text(translate('changeBirthday')),
                  onTap: () => onOpenChangeBirthday(chart),
                ),
                ListTile(
                  leading: const Icon(Icons.visibility_outlined),
                  title: Text(translate('changeWatchingYear')),
                  onTap: () => onOpenChangeWatchingYear(chart),
                ),
                // ListTile(
                //   leading: const Icon(Icons.label_outline),
                //   title: Text(translate('tagging')),
                // ),
                // ListTile(
                //   leading: const Icon(Icons.sticky_note_2_outlined),
                //   title: Text(translate('note')),
                // ),
                // const SizedBox(height: 48),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
