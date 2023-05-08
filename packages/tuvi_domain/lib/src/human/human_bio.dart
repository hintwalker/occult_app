part of tuvi_domain;

class HumanBio {
  final String name;
  final Moment birthDay;
  final int watchingYear;
  final Gender gender;
  const HumanBio({
    required this.name,
    required this.birthDay,
    required this.watchingYear,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      HumanBioKey.luniMonthIndex.name: birthDay.luniSolarDate.month - 1,
      HumanBioKey.hourIndex.name: Chi.ofTime(birthDay.time).index,
    };
  }

  DuongNamAmNu get dnan {
    final isDuong = Chi.ofLuniYear(birthDay.luniSolarDate.year).index % 2 == 0;
    if (gender == Gender.male) {
      if (isDuong) {
        return DuongNamAmNu.duongNam;
      } else {
        return DuongNamAmNu.amNam;
      }
    } else {
      if (isDuong) {
        return DuongNamAmNu.duongNu;
      } else {
        return DuongNamAmNu.amNu;
      }
    }
  }
}
