import '../school/school_name.dart';
import '../star/star_formula_key.dart';

class SkyConfig {
  final SchoolName school;
  final Map<String, dynamic> options;
  SkyConfig({required this.school, Map<String, dynamic>? options})
      : options = {...basicOptions, ...options ?? {}};
  factory SkyConfig.basic() => SkyConfig(school: SchoolName.basic);

  static Map<String, dynamic> basicOptions = {
    StarFormulaKey.amSatOption.name: 0,
    StarFormulaKey.dauQuanOption.name: 0,
    StarFormulaKey.dongHoaKhoa.name: 0,
    StarFormulaKey.hoaLinhOption.name: 0,
    StarFormulaKey.khoiVietOption.name: 0,
    StarFormulaKey.luuHaOption.name: 0,
    StarFormulaKey.nhatHoaQuyen.name: 0,
    StarFormulaKey.phuHoaKhoa.name: 0,
    StarFormulaKey.tuongTinhOption.name: 0,
  };
  // factory SkyConfig.tuViVietNam() => SkyConfig(school: SchoolName.tuViVietNam);
  // SchoolName get school => SchoolName.tranDoan;
}
