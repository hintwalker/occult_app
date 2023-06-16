part of '../main.dart';

class ChartsScreen extends StatelessWidget {
  const ChartsScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId, child: const Placeholder());
  }
}
