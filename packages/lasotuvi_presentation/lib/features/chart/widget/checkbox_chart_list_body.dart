part of lasotuvi_presentation;

class CheckBoxChartListBody extends ConsumerStatefulWidget {
  const CheckBoxChartListBody({
    super.key,
    required this.onSubmit,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CheckBoxChartListBodyState();
  final void Function(BuildContext context, Iterable<Chart> charts, String? uid)
      onSubmit;
}

class _CheckBoxChartListBodyState
    extends AuthDependedState<CheckBoxChartListBody> {
  @override
  Widget build(BuildContext context) {
    return CheckboxChartListBuilder(
      controller: ref.read(chartListControllerProvider),
      uid: uid,
      translate: translate,
      colorScheme: lightColorScheme,
      onCancel: onCancel,
      onSubmit: widget.onSubmit,
    );
  }

  void onCancel(BuildContext context) {
    context.pop();
  }
}
