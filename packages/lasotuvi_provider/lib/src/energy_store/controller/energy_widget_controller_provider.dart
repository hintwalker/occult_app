import 'package:energy_store/energy_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../usecase/on_energy_provider.dart';

final energyWidgetControllerProvider =
    ChangeNotifierProvider<EnergyWidgetController>(
        (ref) => EnergyWidgetController(onEnergy: ref.read(onEnergyProvider)));
