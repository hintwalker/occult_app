part of storage_options;

class ListTileDownload extends StatelessWidget {
  const ListTileDownload({
    super.key,
    required this.onTap,
    required this.translate,
  });
  final void Function() onTap;
  final String Function(String) translate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.file_download_outlined),
      title: Text(translate('download')),
      onTap: onTap,
    );
  }
}
