part of '../main.dart';

class AllNotesScreen extends StatelessWidget {
  const AllNotesScreen({
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
