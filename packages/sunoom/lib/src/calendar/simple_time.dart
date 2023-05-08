part of sunoom;

@freezed
class SimpleTime with _$SimpleTime {
  const factory SimpleTime({
    @Default(0) int hour,
    @Default(0) int minute,
    @Default(0) int second,
  }) = _SimpleTime;
}
