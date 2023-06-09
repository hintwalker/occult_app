part of storage_options;

class ListTileDeleteFromCloud extends StatelessWidget {
  const ListTileDeleteFromCloud({
    super.key,
    required this.onTap,
    required this.translate,
  });
  final void Function() onTap;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.cloud_off),
      title: Text(translate('deleteFromCloud')),
      onTap: onTap,
    );
  }
}
