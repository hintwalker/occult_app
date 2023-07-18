import '../entity/book_item.dart';
import '../repository/book_list_repository.dart';

class TakeAllBookList {
  const TakeAllBookList(this.repository);
  final BookListRepository repository;
  Future<Iterable<BookItem>> call() => repository.allData();
}
