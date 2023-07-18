import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import '../data_source/remote_book_data_source.dart';

final remoteBookRepositoryProvider = Provider.autoDispose<RemoteBookRepository>(
  (ref) => RemoteBookRepository(
    ref.read(
      remoteBookDataSourceProvider,
    ),
  ),
);
