import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:lasotuvi_provider/src/library/usecase/take_all_book_list.dart';

final bookListControllerProvider =
    ChangeNotifierProvider.autoDispose<BookListController>(
  (ref) => BookListController(
    ref.read(
      takeAllBookListProvider,
    ),
  ),
);
