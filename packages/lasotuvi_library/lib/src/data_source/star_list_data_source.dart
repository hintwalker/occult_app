import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/star_item.dart';

class StarListDataSource extends JsonListDataSource<StarItem> {
  StarListDataSource() : super(fromMap: StarItem.fromMap);

  @override
  String get dataPath => 'packages/lasotuvi_library/assets/star_list.json';
}
