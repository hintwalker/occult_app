part of lasotuvi_provider;

final energyDataSourceProvider = Provider.autoDispose<EnergyDataSource>(
    (ref) => EnergyDataSource(ref.read(firestoreServiceProvider)));
