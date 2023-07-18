import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../repository/book_list_repository.dart';

final takeAllBookListProvider = Provider.autoDispose<TakeAllBookList>(
  (ref) => TakeAllBookList(
    ref.read(bookListRepositoryProvider),
  ),
);
