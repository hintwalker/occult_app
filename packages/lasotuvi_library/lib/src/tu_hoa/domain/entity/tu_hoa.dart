import 'package:equatable/equatable.dart';

class TuHoa extends Equatable {
  const TuHoa({
    required this.can,
    required this.loc,
    required this.quyen,
    required this.khoa,
    required this.ki,
    required this.school,
    required this.diff,
  });

  final String can;
  final String loc;
  final String quyen;
  final String khoa;
  final String ki;
  final String school;
  final Iterable<String> diff;

  const TuHoa.initial({
    this.can = '',
    this.loc = '',
    this.quyen = '',
    this.khoa = '',
    this.ki = '',
    this.school = '',
    this.diff = const [],
  });

  TuHoa copyWith({
    String? can,
    String? loc,
    String? quyen,
    String? khoa,
    String? ki,
    String? school,
    Iterable<String>? diff,
  }) =>
      TuHoa(
        can: can ?? this.can,
        loc: loc ?? this.loc,
        quyen: quyen ?? this.quyen,
        khoa: khoa ?? this.khoa,
        ki: ki ?? this.ki,
        school: school ?? this.school,
        diff: diff ?? this.diff,
      );
  static TuHoa fromMap(Map<String, dynamic> map) {
    return const TuHoa.initial().copyWith(
        can: map['can'] as String,
        school: map['school'] as String,
        loc: map['loc'] as String,
        quyen: map['quyen'] as String,
        khoa: map['khoa'] as String,
        ki: map['ki'] as String,
        diff: (map['diff'] as String).split(','));
  }

  @override
  List<Object?> get props => [can, loc, quyen, khoa, ki, school, diff];
}
