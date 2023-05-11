part of lasotuvi_provider;

final takeEnergyProvider = Provider.autoDispose<TakeEnergy>(
    (ref) => TakeEnergy(ref.read(energyRepositoryProvider)));
