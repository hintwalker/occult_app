import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../usecase/download_book_to_local.dart';

final bookReaderControllerProvider = Provider.autoDispose<BookReaderController>(
  (ref) => BookReaderController(
    downloadBookToLocal: ref.read(
      downloadBookToLocalProvider,
    ),
  ),
);
