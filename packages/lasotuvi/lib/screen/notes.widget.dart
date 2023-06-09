part of '../main.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({
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
