part of storage_options;

class ListTileUpload extends StatelessWidget {
  const ListTileUpload({
    super.key,
    required this.onTap,
    required this.translate,
  });
  final void Function() onTap;
  final String Function(String) translate;
  // final String? uid;
  // final String? onCloud;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.cloud_upload_outlined),
      title: Text(translate('upload')),
      onTap: onTap,
    );
  }
}
