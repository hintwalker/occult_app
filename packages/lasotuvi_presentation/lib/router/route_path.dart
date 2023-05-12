part of lasotuvi_presentation;

class RoutePath {
  static const welcome = '/welcome';
  static const dashboard = '/';
  static const splash = '/splash';
  static const chartCreation = '/chart/creation/:${RouterParams.uid}';
  static const chartView =
      '/chart/view/:${RouterParams.uid}/:${RouterParams.chartId}';
  static const allCharts = '/dashboard/chart/all/:${RouterParams.uid}';

  static const allChartsWithDrawer = '/chart/all/:${RouterParams.uid}';

  static const tagCreation = '/tag/creation/:${RouterParams.uid}';
  static const tagView =
      '/tag/view/:${RouterParams.uid}/:${RouterParams.tagId}';
  static const allTags = '/tag/all/:${RouterParams.uid}';

  // static const noteView =
  //     '/note/view/:${RouterParams.uid}/:${RouterParams.noteId}';

  static const allNotes = '/note/all/:${RouterParams.uid}';

  static const noteEditor =
      '/note/editor/:${RouterParams.uid}/:${RouterParams.chartId}/:${RouterParams.noteId}';

  static const checkboxTagList =
      '/tag/select/:${RouterParams.uid}/:${RouterParams.chartId}';
  static const chartSelection = '/chart/selection/:${RouterParams.uid}';

  static const verifyUser = '/verifyUser';

  static var market = '/market';
  static var energyMarket = '/energyMarket';
}
