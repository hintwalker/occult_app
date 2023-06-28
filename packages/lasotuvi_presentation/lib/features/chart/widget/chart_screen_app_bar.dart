part of lasotuvi_presentation;

class ChartScreenAppBar extends StatelessWidget {
  const ChartScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenAppBar('',
        // actions: [EnergyPointAppBarAction()],
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ]);
  }
}
