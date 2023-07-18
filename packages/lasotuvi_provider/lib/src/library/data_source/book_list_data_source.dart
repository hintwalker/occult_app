import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';

final bookListDataSourceProvider = Provider.autoDispose<BookListDataSource>(
  (ref) => BookListDataSource(),
);
