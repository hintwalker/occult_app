part of '../main.dart';

class AllTagsScreen extends StatelessWidget {
  const AllTagsScreen({
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
