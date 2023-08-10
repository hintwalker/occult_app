import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:tauari_date_format/tauari_date_format.dart';
import 'package:tauari_ui/tauari_ui.dart';

import 'chart_creation_notifier.dart';
import 'forms/chart_creation_step1.dart';
import 'forms/chart_creation_step2.dart';
import 'forms/chart_creation_step3.dart';

class ChartCreationForm extends ConsumerStatefulWidget {
  const ChartCreationForm({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onCreateChart,
  });

  final ColorScheme colorScheme;
  final String Function(String) translate;
  final Future<void> Function(Chart chart) onCreateChart;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartCreationFormState();
}

class _ChartCreationFormState extends ConsumerState<ChartCreationForm> {
  int currentStep = 0;
  int upperBound = 2;

  void nextStep() {
    setState(() {
      if (currentStep < upperBound) currentStep++;
    });
  }

  void previousStep() {
    setState(() {
      if (currentStep > 0) currentStep--;
    });
  }

  void goToStep(int step) {
    setState(() {
      currentStep = step;
    });
  }

  void createChart() async {
    await widget.onCreateChart(ref.read(chartCreationNotifierProvider).chart);
    // final id = await ref.read(insertChartToLocalProvider)(
    //     ref.watch(chartCreationNotifierProvider));
    // if (context.mounted) {
    //   context.pushReplacementNamed(RouteName.chartView,
    //       params: {'chartId': '$id'});
    // }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chartCreationNotifierProvider);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stepper(
          currentStep: currentStep,
          onStepCancel: previousStep,
          onStepContinue: nextStep,
          onStepTapped: goToStep,
          physics: const ClampingScrollPhysics(),
          steps: getSteps(state.chart),
          controlsBuilder: (context, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (currentStep > 0)
                  IconButton(
                    iconSize: 24,
                    onPressed: previousStep,
                    icon: const Icon(Icons.arrow_back),
                  ),
                const SizedBox(
                  width: 48,
                ),
                currentStep == upperBound
                    ? ElevatedButton.icon(
                        onPressed: state.valid ? createChart : null,
                        label: Text(
                          widget.translate('createChart'),
                          style: TextStyle(color: widget.colorScheme.onPrimary),
                        ),
                        icon: Icon(
                          Icons.done_all,
                          color: widget.colorScheme.onPrimary,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: widget.colorScheme.primary),
                      )
                    : ElevatedButton.icon(
                        onPressed: state.valid ? nextStep : null,
                        label: Text(widget.translate('tiepTheo')),
                        icon: const Icon(Icons.arrow_forward),
                      ),
              ],
            );
          },
        ));
  }

  List<Step> getSteps(Chart chart) {
    return <Step>[
      Step(
        title: Text(widget.translate('duongSo'),
            style: TextStyle(color: widget.colorScheme.primary)),
        subtitle: Row(children: [
          CircleHumanAvatar(
            gender: chart.gender.intValue,
            path: chart.avatar,
            size: 24,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text('${chart.name}, ${widget.translate(chart.gender.name)}')
        ]),
        content: ChartCreationStep1(
          colorScheme: widget.colorScheme,
          translate: widget.translate,
        ),
        state: getStepState(0),
        isActive: isStepActive(0),
      ),
      Step(
        title: Text(widget.translate('ngaySinh'),
            style: TextStyle(color: widget.colorScheme.primary)),
        subtitle: Text(chart.birthday.toStringVn()),
        content: ChartCreationStep2(
          colorScheme: widget.colorScheme,
          translate: widget.translate,
        ),
        state: getStepState(1),
        isActive: isStepActive(1),
      ),
      Step(
        title: Text(widget.translate('namXem'),
            style: TextStyle(color: widget.colorScheme.primary)),
        subtitle: Text('${chart.watchingYear}'),
        content: ChartCreationStep3(
          colorScheme: widget.colorScheme,
          translate: widget.translate,
        ),
        state: getStepState(2),
        isActive: isStepActive(2),
      ),
      // Step(
      //   title: Text(widget.translate('tuyChon')),
      //   content: const Text('Step 4'),
      //   state: getStepState(3),
      //   isActive: isStepActive(3),
      // ),
    ];
  }

  StepState getStepState(int step) {
    if (step == currentStep) return StepState.editing;
    return currentStep > step ? StepState.complete : StepState.indexed;
  }

  bool isStepActive(int step) {
    return currentStep >= step;
  }
}
