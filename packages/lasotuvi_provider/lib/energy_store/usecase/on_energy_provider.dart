part of lasotuvi_provider;

final onEnergyProvider = Provider.autoDispose<OnEnergy>(
    (ref) => OnEnergy(ref.read(energyRepositoryProvider)));
