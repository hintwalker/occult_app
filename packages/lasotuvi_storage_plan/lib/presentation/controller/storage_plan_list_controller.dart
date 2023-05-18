part of lasotuvi_storage_plan;

class StoragePlanListController extends ChangeNotifier {
  StoragePlanListController({
    required this.takeAllStoragePlans,
    // this.registeredPlanId,
  });

  // String? registeredPlanId;
  // Iterable<StoragePlan> plans = [];
  final TakeAllStoragePlans takeAllStoragePlans;

  // Future<void> initialize({String? uid, String? registeredPlanId}) async {
  //   plans = await _loadAllPlans(uid);
  //   this.registeredPlanId = registeredPlanId;
  //   initializing = false;
  //   notifyListeners();
  // }

  // void setRegisteredPlan(String id) {
  //   registeredPlanId = id;
  //   notifyListeners();
  // }

  Future<Iterable<StoragePlan>> allPlans(String? uid) async {
    return await takeAllStoragePlans(uid);
  }
}
