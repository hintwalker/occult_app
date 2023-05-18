part of energy_store;

class EnergyStoreController extends ChangeNotifier {
  EnergyStoreController({
    required this.queryProductDetails,
    required this.availableForSell,
    required this.buyConsumableProduct,
    required this.productIds,
    required this.postResolvePurchase,
    required this.subscribePurchaseListingChanges,
    required this.availableNetwork,
    required this.getUid,
    required this.plusEnergy,
    required this.takeEnergy,
  });

  final QueryProductDetails queryProductDetails;
  final AvailableForSell availableForSell;
  final BuyConsumableProduct buyConsumableProduct;
  final Iterable<String> productIds;
  final PostResolvePurchase postResolvePurchase;
  final SubscribePurchaseListingChanges subscribePurchaseListingChanges;

  final PlusEnergy plusEnergy;
  final TakeEnergy takeEnergy;

  final Future<bool> Function() availableNetwork;
  final Future<String?> Function() getUid;

  late StreamSubscription<List<PurchaseDetails>> _subscription;

  List<ProductDetails> products = [];
  bool progressing = false;
  bool initializing = true;
  // Energy _currentEnergy = const Energy(0);

  Future<void> initStore() async {
    products = await _loadProducts();

    // _currentEnergy = await _loadCurrentEnergy();
    _subscribe();
    initializing = false;
    notifyListeners();

    // state = AsyncValue.data(EnergyStoreState(
    //   products: _preloadProducts,
    //   //  energy: _currentEnergy
    // ));
  }

  Future<List<ProductDetails>> _loadProducts() async {
    final response = await queryProductDetails(productIds);
    final result = response.productDetails;
    result.sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
    return result;
  }

  // Future<Energy> _loadCurrentEnergy() async {
  //   final uid = await getUid();
  //   final energy = uid == null ? const Energy(0) : await takeEnergy(uid);
  //   return energy;
  // }

  Future<bool> buy(ProductDetails product) async {
    progressing = true;
    notifyListeners();
    return await buyConsumableProduct(product);
  }

  void _subscribe() {
    _subscription = subscribePurchaseListingChanges(
      (purchaseDetailsList) {
        postResolvePurchase(
          purchaseDetailsList,
          onDelivery: _onDelivery,
          onError: (p0) {},
          onPending: (p0) {},
        );
      },
      onDone: () => _subscription.cancel(),
    );
  }

  Future<void> _onDelivery(int value) async {
    // state = const AsyncValue.loading();
    if (await availableNetwork()) {
      final uid = await getUid();

      if (uid != null) {
        await plusEnergy(uid, value);
        // _currentEnergy = await plusEnergy(uid, value);
      }
    }
    progressing = false;
    notifyListeners();
    // state = AsyncValue.data(EnergyStoreState(
    //     // energy: _currentEnergy,
    //     products: _preloadProducts));
    //kiem tra network
    //lay user id
    //
    //lay gia tri cu tren cloud
    //cong value vao cloud
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
