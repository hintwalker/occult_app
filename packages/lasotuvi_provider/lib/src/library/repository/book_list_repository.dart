import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../data_source/book_list_data_source.dart';

final bookListRepositoryProvider = Provider.autoDispose<BookListRepository>(
  (ref) => BookListRepository(
    ref.read(
      bookListDataSourceProvider,
    ),
  ),
);
