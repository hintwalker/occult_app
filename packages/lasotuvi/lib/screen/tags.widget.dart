part of '../main.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({
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
