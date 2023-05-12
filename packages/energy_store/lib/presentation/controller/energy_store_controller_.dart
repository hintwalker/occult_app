// part of energy_store;

// class EnergyStoreController
//     extends StateNotifier<AsyncValue<EnergyStoreState>> {
//   EnergyStoreController({
//     required this.queryProductDetails,
//     required this.availableForSell,
//     required this.buyConsumableProduct,
//     required this.productIds,
//     required this.postResolvePurchase,
//     required this.subscribePurchaseListingChanges,
//     required this.availableNetwork,
//     required this.getUid,
//     required this.plusEnergy,
//     required this.takeEnergy,
//   }) : super(const AsyncValue.loading());

//   final QueryProductDetails queryProductDetails;
//   final AvailableForSell availableForSell;
//   final BuyConsumableProduct buyConsumableProduct;
//   final Iterable<String> productIds;
//   final PostResolvePurchase postResolvePurchase;
//   final SubscribePurchaseListingChanges subscribePurchaseListingChanges;

//   final PlusEnergy plusEnergy;
//   final TakeEnergy takeEnergy;

//   final Future<bool> Function() availableNetwork;
//   final Future<String?> Function() getUid;

//   late StreamSubscription<List<PurchaseDetails>> _subscription;

//   List<ProductDetails> _preloadProducts = [];
//   // Energy _currentEnergy = const Energy(0);

//   Future<void> initStore() async {
//     _preloadProducts = await _loadProducts();
//     // _currentEnergy = await _loadCurrentEnergy();
//     _subscribe();
//     state = AsyncValue.data(EnergyStoreState(
//       products: _preloadProducts,
//       //  energy: _currentEnergy
//     ));
//   }

//   Future<List<ProductDetails>> _loadProducts() async {
//     final response = await queryProductDetails(productIds);
//     return response.productDetails;
//   }

//   Future<Energy> _loadCurrentEnergy() async {
//     final uid = await getUid();
//     final energy = uid == null ? const Energy(0) : await takeEnergy(uid);
//     return energy;
//   }

//   Future<bool> buy(ProductDetails product) async {
//     return await buyConsumableProduct(product);
//   }

//   void _subscribe() {
//     _subscription = subscribePurchaseListingChanges(
//       (purchaseDetailsList) {
//         postResolvePurchase(
//           purchaseDetailsList,
//           onDelivery: _onDelivery,
//           onError: (p0) {},
//           onPending: (p0) {},
//         );
//       },
//       onDone: () => _subscription.cancel(),
//     );
//   }

//   Future<void> _onDelivery(int value) async {
//     state = const AsyncValue.loading();
//     if (await availableNetwork()) {
//       final uid = await getUid();

//       if (uid != null) {
//         await plusEnergy(uid, value);
//         // _currentEnergy = await plusEnergy(uid, value);
//       }
//     }
//     state = AsyncValue.data(EnergyStoreState(
//         // energy: _currentEnergy,
//         products: _preloadProducts));
//     //kiem tra network
//     //lay user id
//     //
//     //lay gia tri cu tren cloud
//     //cong value vao cloud
//   }

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }
// }
