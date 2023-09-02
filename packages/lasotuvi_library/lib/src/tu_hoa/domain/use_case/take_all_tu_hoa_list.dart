import '../../domain/entity/tu_hoa.dart';

import '../../domain/repository/tu_hoa_list_repository.dart';

class TakeAllTuHoaList {
  const TakeAllTuHoaList(this.repository);
  final TuHoaListRepository repository;
  Future<Iterable<TuHoa>> call() => repository.allData();
}
