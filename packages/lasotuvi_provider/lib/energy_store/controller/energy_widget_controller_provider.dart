part of lasotuvi_provider;

final energyWidgetControllerProvider =
    ChangeNotifierProvider.autoDispose<EnergyWidgetController>(
        (ref) => EnergyWidgetController(onEnergy: ref.read(onEnergyProvider)));
