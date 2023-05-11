part of energy_store;

class EnergyDataSource extends CloudSingleDocDataSource<EnergyModel> {
  EnergyDataSource({required super.service})
      : super(
          itemMapper: (snapshot) => snapshotToModel(snapshot,
              fromMap: EnergyModel.fromMap, idIsString: true),
        );

  @override
  String dataCollectionPath(String uid) => 'e/$uid/e';

  @override
  String get docId => docIdEnergy;
}
