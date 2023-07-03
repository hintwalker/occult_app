part of lasotuvi_tag;

class TagDetailModal extends StatelessWidget {
  const TagDetailModal({
    super.key,
    required this.title,
    required this.colorScheme,
    required this.child,
  });
  final String title;
  final ColorScheme colorScheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BasicModal(
      title: title,
      colorScheme: colorScheme,
      child: child,
    );
  }
}
