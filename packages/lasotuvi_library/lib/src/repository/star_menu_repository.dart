import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/star_menu_item.dart';

class StarMenuRepository extends JsonListRepositoryImpl<StarMenuItem> {
  StarMenuRepository(super.dataSource);
}
