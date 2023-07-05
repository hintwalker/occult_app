part of tuvi_chart_creation_form;

class ChartWatchingYearInput extends ConsumerStatefulWidget {
  const ChartWatchingYearInput({
    super.key,
    required this.controller,
    required this.colorScheme,
    required this.translate,
  });
  final WatchingYearController controller;
  final ColorScheme colorScheme;
  final String Function(String) translate;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartWatchingYearInputState();
}

class _ChartWatchingYearInputState
    extends ConsumerState<ChartWatchingYearInput> {
  final _formKey = GlobalKey<FormState>();
  int watchingYear = DateTime.now().year;

  // late int initValue = 2023;
  @override
  void initState() {
    super.initState();
    setState(() {
      watchingYear = int.parse(widget.controller.value);
    });
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     initValue = ref.read(chartCreationNotifierProvider).chart.watchingYear;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final canYear = Can.ofLuniYear(watchingYear);
    final chiYear = Chi.ofLuniYear(watchingYear);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: watchingYear.toString(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(4),
              FilteringTextInputFormatter.digitsOnly
            ],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '!';
              }
              return null;
            },
            onChanged: (value) {
              widget.controller
                  .onChanged(value, _formKey.currentState!.validate());
              setState(() {
                watchingYear = int.parse(value);
              });

              // ref
              //     .read(chartCreationNotifierProvider.notifier)
              //     .updateValid(_formKey.currentState!.validate());
              // if (_formKey.currentState!.validate()) {
              //   ref
              //       .read(chartCreationNotifierProvider.notifier)
              //       .updateWatchingYear(value);
              // }
            },
          ),
          const SizedBox(
            height: 8.0,
          ),
          CanChiGroup(
            can: canYear.value,
            chi: chiYear.value,
            colorScheme: widget.colorScheme,
            translate: widget.translate,
          )
        ],
      ),
    );
  }
}
