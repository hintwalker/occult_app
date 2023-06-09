part of lasotuvi_library;

Future<String> downloadStarInfo(String starName) async {
  final storageRef = FirebaseStorage.instance.ref();
  final islandRef = storageRef.child('stars/$starName.md');

  try {
    const oneMegabyte = 1024 * 1024;
    final Uint8List? data = await islandRef.getData(oneMegabyte);
    if (data == null) {
      return '';
    }
    final stringData = const Utf8Decoder().convert(data);
    return stringData;
    // Data for "images/island.jpg" is returned, use this as needed.
  } on FirebaseException catch (e) {
    if (kDebugMode) {
      print(e.message);
    }
    // Handle any errors.
    return '';
  }
}
