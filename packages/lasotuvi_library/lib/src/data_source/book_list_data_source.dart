import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/book_item.dart';

class BookListDataSource extends JsonListDataSource<BookItem> {
  BookListDataSource() : super(fromMap: BookItem.fromMap);

  @override
  String get dataPath => 'packages/lasotuvi_library/assets/book_list.json';
}
