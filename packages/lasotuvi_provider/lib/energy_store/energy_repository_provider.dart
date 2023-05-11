part of lasotuvi_provider;

final energyRepositoryProvider = Provider.autoDispose<EnergyRepository>((ref) =>
    EnergyRepositoryImpl(ref.read(energyDataSourceProvider),
        entityToModel: (entity) => EnergyModel.fromEntity(entity)));
