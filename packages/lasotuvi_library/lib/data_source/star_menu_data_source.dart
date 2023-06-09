part of lasotuvi_library;

class StarMenuDataSource extends JsonListDataSource<StarMenuItem> {
  StarMenuDataSource() : super(fromMap: StarMenuItem.fromMap);

  @override
  String get dataPath => 'packages/lasotuvi_library/assets/star_menus.json';
}
