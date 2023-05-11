part of lasotuvi_presentation;

class EnergyStoreScreenBody extends ConsumerWidget {
  const EnergyStoreScreenBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(energyStoreControllerProvider.notifier).initStore();
    });
    final state = ref.watch(energyStoreControllerProvider);
    return state.maybeWhen(
      data: (data) {
        return EnergyStoreWidget(
            products: data.products,
            colorScheme: ThemeData.light().colorScheme,
            translate: (text) => text,
            onItemTap: (product) async {
              await ref
                  .read(energyStoreControllerProvider.notifier)
                  .buy(product);
            });
      },
      orElse: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
