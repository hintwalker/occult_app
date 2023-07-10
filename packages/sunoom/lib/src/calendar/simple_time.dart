import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_time.freezed.dart';

@freezed
class SimpleTime with _$SimpleTime {
  const factory SimpleTime({
    @Default(0) int hour,
    @Default(0) int minute,
    @Default(0) int second,
  }) = _SimpleTime;
}
