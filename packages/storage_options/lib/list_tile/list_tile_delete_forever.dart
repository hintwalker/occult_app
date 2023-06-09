part of storage_options;

class ListTileDeleteForever extends StatelessWidget {
  const ListTileDeleteForever({
    super.key,
    required this.onTap,
    required this.colorScheme,
    required this.translate,
  });
  final void Function() onTap;
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      iconColor: colorScheme.error,
      textColor: colorScheme.error,
      leading: const Icon(Icons.delete_forever),
      title: Text(translate('deleteForever')),
      onTap: onTap,
    );
  }
}
