part of lasotuvi_tag;

class TagItemCardWidget extends StatelessWidget {
  const TagItemCardWidget(
    this.data, {
    super.key,
    required this.colorScheme,
    required this.translate,
    this.onTap,
    this.uid,
  });
  final Tag data;
  final String Function(String) translate;
  final ColorScheme colorScheme;
  final void Function(BuildContext, Tag, String? uid)? onTap;
  final String? uid;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap != null ? () => onTap!(context, data, uid) : null,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              HoriTagTitleWidget(data.title),
              HoriTagSubTitleWidget(data.subTitle),
            ],
          ),
        ),
      ),
    );
  }
}
