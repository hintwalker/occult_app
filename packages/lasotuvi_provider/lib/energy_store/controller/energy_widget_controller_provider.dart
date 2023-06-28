part of lasotuvi_provider;

final energyWidgetControllerProvider =
    ChangeNotifierProvider<EnergyWidgetController>(
        (ref) => EnergyWidgetController(onEnergy: ref.read(onEnergyProvider)));
