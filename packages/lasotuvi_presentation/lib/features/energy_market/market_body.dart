part of lasotuvi_presentation;

class MarketBody extends ConsumerStatefulWidget {
  const MarketBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EnergyMarketScreenBodyState();
}

class _EnergyMarketScreenBodyState extends ConsumerState<MarketBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(energyStoreControllerProvider.notifier).initStore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final initializing = ref.watch(
        energyStoreControllerProvider.select((value) => value.initializing));
    return initializing
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: EnergyStoreWidget(
                    products: ref.watch(energyStoreControllerProvider
                        .select((value) => value.products)),
                    colorScheme: lightColorScheme,
                    translate: (text) => text,
                    onItemTap: (product) async {
                      await ref
                          .read(energyStoreControllerProvider.notifier)
                          .buy(product);
                    }),
              ),
              if (ref.watch(energyStoreControllerProvider
                  .select((value) => value.progressing)))
                const Center(child: CircularProgressIndicator()),
            ],
          );
    // return state.maybeWhen(
    //   data: (data) {
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 12.0),
    //       child: EnergyStoreWidget(
    //           products: data.products,
    //           colorScheme: lightColorScheme,
    //           translate: (text) => text,
    //           onItemTap: (product) async {
    //             await ref
    //                 .read(energyStoreControllerProvider.notifier)
    //                 .buy(product);
    //           }),
    //     );
    //   },
    //   orElse: () {
    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }
}
