part of lasotuvi_domain;

abstract class ChartRepository extends SyncableRepository<Chart> {
  ChartRepository(
      {required super.localRepository, required super.cloudRepository});
  // Stream<List<Chart>> onLocalCharts({QueryArgs? queryArgs});
  // Stream<List<Chart>> onCloudCharts(String uid, {QueryArgs? queryArgs});
  // Stream<List<Chart>> onCharts(String? uid, {QueryArgs? queryArgs});
  // Stream<int?> onLocalCount();
  // Stream<int?> onCloudCount(String uid);
  // Stream<int?> onCount(String? uid);
  // Future<int> countAll();

  // Future addToLocal(Chart item);
  // Future uploadToCloud(String uid, Chart item);
  // Future deleteFromLocal(int itemId);
  // Future deleteFromCloud(String uid, String docId);

  // Future<Chart?> chartById({String? uid, required int chartId});
  // Future<Chart?> localChartById(int chartId);
  // Future<Chart?> cloudChartById(String uid, int chartId);
}
