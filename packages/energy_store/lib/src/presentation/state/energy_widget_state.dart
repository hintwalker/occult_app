import '../../entity/energy.dart';

class EnergyWidgetState {
  final String? uid;
  final Energy energy;

  const EnergyWidgetState({
    required this.energy,
    this.uid,
  });

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other is EnergyWidgetState &&
          other.runtimeType == runtimeType &&
          other.energy == energy &&
          other.uid == uid;

  @override
  int get hashCode => Object.hash(energy, uid);
}
