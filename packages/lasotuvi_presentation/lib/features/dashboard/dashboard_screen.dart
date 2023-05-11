part of lasotuvi_presentation;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.screen});
  final Widget Function(String drawerId) screen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainNavigation(screen: screen),
    );
  }
}
