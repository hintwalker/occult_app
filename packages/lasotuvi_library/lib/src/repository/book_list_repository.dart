import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/book_item.dart';

class BookListRepository extends JsonListRepositoryImpl<BookItem> {
  BookListRepository(super.dataSource);
}
