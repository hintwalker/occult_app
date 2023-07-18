import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../repository/remote_book_repository.dart';

final downloadBookToLocalProvider = Provider.autoDispose<DownloadBookToLocal>(
  (ref) => DownloadBookToLocal(
    ref.read(
      remoteBookRepositoryProvider,
    ),
  ),
);
