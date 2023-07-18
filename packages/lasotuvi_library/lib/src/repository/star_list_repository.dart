import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/star_item.dart';

class StarListRepository extends JsonListRepositoryImpl<StarItem> {
  StarListRepository(super.dataSource);
}
