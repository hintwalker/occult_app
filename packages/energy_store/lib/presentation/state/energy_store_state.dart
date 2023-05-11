part of energy_store;

class EnergyStoreState {
  const EnergyStoreState({
    required this.energy,
    required this.products,
  });

  final List<ProductDetails> products;
  final Energy energy;

  EnergyStoreState copyWith({
    List<ProductDetails>? products,
    Energy? energy,
  }) {
    return EnergyStoreState(
        energy: energy ?? this.energy, products: products ?? this.products);
  }

  @override
  operator ==(Object? other) =>
      identical(other, this) ||
      other is EnergyStoreState &&
          other.runtimeType == runtimeType &&
          other.energy == energy &&
          listEquals(other.products, products);

  @override
  int get hashCode => Object.hash(energy, products);
}
