part of lasotuvi_presentation;

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 30,
        ),
        UserAuthWidget()
      ],
    );
  }
}
