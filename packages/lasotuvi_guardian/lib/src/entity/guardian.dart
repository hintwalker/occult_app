import 'package:equatable/equatable.dart';

class Guardian extends Equatable {
  const Guardian({
    this.limitChart,
    this.limitNote,
    this.limitTag,
  });
  final int? limitChart;
  final int? limitNote;
  final int? limitTag;

  Guardian copyWith({
    int? limitChart,
    int? limitNote,
    int? limitTag,
  }) =>
      Guardian(
        limitChart: limitChart ?? this.limitChart,
        limitNote: limitNote ?? this.limitNote,
        limitTag: limitTag ?? this.limitTag,
      );

  @override
  List<Object?> get props => [
        limitChart,
        limitNote,
        limitTag,
      ];
}
