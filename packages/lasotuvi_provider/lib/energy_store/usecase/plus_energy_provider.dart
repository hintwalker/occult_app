part of lasotuvi_provider;

final plusEnergyProvider = Provider.autoDispose<PlusEnergy>(
    (ref) => PlusEnergy(ref.read(energyRepositoryProvider)));
