part of lasotuvi_provider;

final energyDataSourceProvider = Provider.autoDispose<EnergyDataSource>(
    (ref) => EnergyDataSource(service: ref.read(firestoreServiceProvider)));
