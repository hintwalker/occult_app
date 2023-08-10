import 'package:equatable/equatable.dart';

enum StatisticWorkingState {
  initial,
  loading,
  loaded,
  failure,
}

class StatisticState extends Equatable {
  final int totalChartCount;
  final int totalTagCount;
  final int totalNoteCount;
  final int cloudChartCount;
  final int cloudTagCount;
  final int cloudNoteCount;
  final int maxChartCount;
  final int maxTagCount;
  final int maxNoteCount;
  // final bool isLoading;
  final String message;
  final bool hasData;
  final StatisticWorkingState state;
  final bool showUpgradeButton;

  const StatisticState({
    this.cloudChartCount = 0,
    this.cloudNoteCount = 0,
    this.cloudTagCount = 0,
    this.hasData = false,
    // this.isLoading = false,
    this.maxChartCount = 0,
    this.maxNoteCount = 0,
    this.maxTagCount = 0,
    this.message = '',
    this.state = StatisticWorkingState.initial,
    this.totalChartCount = 0,
    this.totalNoteCount = 0,
    this.totalTagCount = 0,
    this.showUpgradeButton = false,
  });

  const StatisticState.initial({
    this.cloudChartCount = 0,
    this.cloudNoteCount = 0,
    this.cloudTagCount = 0,
    this.hasData = false,
    // this.isLoading = false,
    this.maxChartCount = 0,
    this.maxNoteCount = 0,
    this.maxTagCount = 0,
    this.message = '',
    this.state = StatisticWorkingState.initial,
    this.totalChartCount = 0,
    this.totalNoteCount = 0,
    this.totalTagCount = 0,
    this.showUpgradeButton = false,
  });

  StatisticState copyWith({
    int? totalChartCount,
    int? totalTagCount,
    int? totalNoteCount,
    int? cloudChartCount,
    int? cloudTagCount,
    int? cloudNoteCount,
    int? maxChartCount,
    int? maxTagCount,
    int? maxNoteCount,
    // bool? isLoading,
    String? message,
    bool? hasData,
    StatisticWorkingState? state,
    bool? showUpgradeButton,
  }) =>
      StatisticState(
        cloudChartCount: cloudChartCount ?? this.cloudChartCount,
        cloudNoteCount: cloudNoteCount ?? this.cloudNoteCount,
        cloudTagCount: cloudTagCount ?? this.cloudTagCount,
        hasData: hasData ?? this.hasData,
        // isLoading: isLoading ?? this.isLoading,
        maxChartCount: maxChartCount ?? this.maxChartCount,
        maxNoteCount: maxNoteCount ?? this.maxNoteCount,
        maxTagCount: maxTagCount ?? this.maxTagCount,
        message: message ?? this.message,
        state: state ?? this.state,
        totalChartCount: totalChartCount ?? this.totalChartCount,
        totalNoteCount: totalNoteCount ?? this.totalNoteCount,
        totalTagCount: totalTagCount ?? this.totalTagCount,
        showUpgradeButton: showUpgradeButton ?? this.showUpgradeButton,
      );
  @override
  List<Object?> get props => [
        cloudChartCount,
        cloudNoteCount,
        cloudTagCount,
        hasData,
        // isLoading,
        maxChartCount,
        maxNoteCount,
        maxTagCount,
        message,
        totalChartCount,
        totalNoteCount,
        totalTagCount,
        state,
        showUpgradeButton,
      ];
}
