part of tuvi_domain;

class SkyConfig {
  final SchoolName school;
  const SkyConfig({required this.school});
  factory SkyConfig.tranDoan() => SkyConfig(school: SchoolName.tranDoan);
  factory SkyConfig.tuViVietNam() => SkyConfig(school: SchoolName.tuViVietNam);
  // SchoolName get school => SchoolName.tranDoan;
}
