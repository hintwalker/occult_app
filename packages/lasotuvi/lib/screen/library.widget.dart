part of '../main.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
        restorationId: restorationId, child: const LibraryScreenBody());
  }
}
