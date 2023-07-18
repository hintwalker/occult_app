import 'file_type.dart';

abstract class RemoteFile {
  const RemoteFile({
    required this.name,
    required this.type,
  });
  final String name;
  final FileType type;
}
