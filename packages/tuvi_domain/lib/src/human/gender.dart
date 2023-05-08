part of tuvi_domain;

enum Gender {
  female(0),
  male(1);

  const Gender(this._intValue);

  final int _intValue;

  int get intValue => _intValue;

  static Gender fromInt(int value) {
    return Gender.values.firstWhere((element) => element.intValue == value);
  }
}
