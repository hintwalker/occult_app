part of lasotuvi_presentation;

class RoutePath {
  static const welcome = '/welcome';
  static const dashboard = '/';
  static const splash = '/splash';
  // static const chartCreation = '/chart/creation/:${RouterParams.uid}';
  static const chartCreation = '/chart/creation';
  static const chartView = '/chart/view/:${RouterParams.chartId}';
  static const charts = '/chart/all';

  // static const chartsWithDrawer = '/chart/all/:${RouterParams.uid}';

  static const tagCreation = '/tag/creation/:${RouterParams.uid}';
  static const tagView =
      '/tag/view/:${RouterParams.uid}/:${RouterParams.tagId}';
  static const tags = '/tag/all/:${RouterParams.uid}';

  // static const noteView =
  //     '/note/view/:${RouterParams.uid}/:${RouterParams.noteId}';

  static const notes = '/note/all';
  static const noteEditor =
      '/note/editor/:${RouterParams.noteId}/:${RouterParams.syncStatus}';

  // static const noteEditor =
  //     '/note/editor/:${RouterParams.uid}/:${RouterParams.chartId}/:${RouterParams.noteId}';

  static const checkboxTagList =
      '/tag/select/:${RouterParams.uid}/:${RouterParams.chartId}';
  static const chartSelection = '/chart/selection/:${RouterParams.uid}';

  static const verifyUser = '/verifyUser';

  static const market = '/market';
  static const energyMarket = '/energyMarket';

  static const storagePlanMarket = '/storagePlanMarket';

  static const home = '/home';

  static const library = '/library';

  static const chartDetail =
      '/chart/:${RouterParams.chartId}/:${RouterParams.syncStatus}';

  static const tagDetail =
      '/tag/:${RouterParams.tagId}/:${RouterParams.syncStatus}';
}
