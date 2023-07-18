import '../entity/star_item.dart';
import '../repository/star_list_repository.dart';

class TakeAllStarList {
  const TakeAllStarList(this.repository);
  final StarListRepository repository;
  Future<Iterable<StarItem>> call() => repository.allData();
}
