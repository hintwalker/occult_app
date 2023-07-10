import 'package:tauari_data_core/tauari_data_core.dart';

import '../entity/star_menu_item.dart';

class StarMenuDataSource extends JsonListDataSource<StarMenuItem> {
  StarMenuDataSource() : super(fromMap: StarMenuItem.fromMap);

  @override
  String get dataPath => 'packages/lasotuvi_library/assets/star_menus.json';
}
