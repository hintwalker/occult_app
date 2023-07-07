part of lasotuvi_presentation;

class DataCreationOptionsModal extends ConsumerWidget {
  const DataCreationOptionsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BasicBottomSheet(
      title: translate('addNewData'),
      colorScheme: lightColorScheme,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...ListTile.divideTiles(
              context: context,
              tiles: [
                ListTile(
                  leading: const Icon(Icons.badge_outlined),
                  title: Text(translate('addNewChart')),
                  onTap: () {
                    context.pop();
                    ChartHelper.openChartCreationScreen(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.label),
                  title: Text(translate('addNewTag')),
                  onTap: () {
                    context.pop();
                    TagHelper.openTagCreationScreen(
                      context,
                      (tag) =>
                          TagHelper.openTagDetail(context: context, tag: tag),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.sticky_note_2_outlined),
                  title: Text(translate('addNewNote')),
                  onTap: () {
                    context.pop();
                    NoteHelper.openChartSelectionScreen(context, ref);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
