import 'package:tauari_data_core/tauari_data_core.dart';

import '../domain/entity/tu_hoa.dart';

class TuHoaListDataSource extends JsonListDataSource<TuHoa> {
  TuHoaListDataSource() : super(fromMap: (map) => TuHoa.fromMap(map));

  @override
  String get dataPath => 'packages/lasotuvi_library/assets/tu_hoa_list.json';
}
