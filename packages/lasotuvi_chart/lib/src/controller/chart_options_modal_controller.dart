import 'package:flutter/material.dart';
import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import 'package:tauari_settings/tauari_settings.dart';
import 'package:tuvi_domain/tuvi_domain.dart';

class ChartOptionsModalController extends ChangeNotifier {
  Map<String, dynamic> options = SkyConfig.basicOptions;
  void init() {
    // await TauariSettings.openBox(chartOptionsBoxName);
    options = TauariSettings.getAll(
        chartOptionsBoxName, SkyConfig.basicOptions.keys,
        defaultValue: 0);
    notifyListeners();
    // options[StarFormulaKey.showAmSat.name] = TauariSettings.dataOfKey(
    //   chartOptionsBoxName,
    //   StarFormulaKey.showAmSat.name,
    //   defaultValue: 0,
    // );
    // options[StarFormulaKey.showTuongTinhCircle.name] = TauariSettings.dataOfKey(
    //   chartOptionsBoxName,
    //   StarFormulaKey.showTuongTinhCircle.name,
    //   defaultValue: 0,
    // );
    // options[StarFormulaKey.dongHoaKhoa.name] = TauariSettings.dataOfKey(
    //   chartOptionsBoxName,
    //   StarFormulaKey.dongHoaKhoa.name,
    //   defaultValue: 0,
    // );
  }

  void setShowAmSat(bool? value) {
    setStarVisibility(StarFormulaKey.showAmSat.name, value);
  }

  void setShowTuongTinhCircle(bool? value) {
    setStarVisibility(StarFormulaKey.showTuongTinhCircle.name, value);
  }

  void setStarVisibility(String key, bool? value) {
    options[key] = value == null
        ? 0
        : value
            ? 1
            : 0;
    notifyListeners();
  }

  void setStarFormulaOption(String key, bool? value) {
    options[key] = value == null
        ? 1
        : value
            ? 0
            : 1;
    notifyListeners();
  }

  bool get showAmSat => options[StarFormulaKey.showAmSat.name] == 1;
  bool get showTuongTinhCircle =>
      options[StarFormulaKey.showTuongTinhCircle.name] == 1;
  bool get dongHoaKhoa => options[StarFormulaKey.dongHoaKhoa.name] == 0;
  bool get nhatHoaQuyen => options[StarFormulaKey.nhatHoaQuyen.name] == 0;
  bool get phuHoaKhoa => options[StarFormulaKey.phuHoaKhoa.name] == 0;
  bool get truongSinhNormal =>
      options[StarFormulaKey.truongSinhOption.name] == 0;
  bool get hoaTinhMao => options[StarFormulaKey.hoaLinhOption.name] == 0;
  bool get thienKhoiNgo => options[StarFormulaKey.khoiVietOption.name] == 0;
  bool get luuHaDinhThan => options[StarFormulaKey.luuHaOption.name] == 0;
  bool get dauQuanChiNamSinh => options[StarFormulaKey.dauQuanOption.name] == 0;

  void setDongHoaKhoa(bool? value) {
    setStarFormulaOption(StarFormulaKey.dongHoaKhoa.name, value);
  }

  void setNhatHoaQuyen(bool? value) {
    setStarFormulaOption(StarFormulaKey.nhatHoaQuyen.name, value);
  }

  void setPhuHoaKhoa(bool? value) {
    setStarFormulaOption(StarFormulaKey.phuHoaKhoa.name, value);
  }

  void setThienKhoiNgo(bool? value) => setStarFormulaOption(
        StarFormulaKey.khoiVietOption.name,
        value,
      );

  void setTruongSinhNormal(bool? value) => setStarFormulaOption(
        StarFormulaKey.truongSinhOption.name,
        value,
      );

  void setHoaTinhMao(bool? value) => setStarFormulaOption(
        StarFormulaKey.hoaLinhOption.name,
        value,
      );

  void setLuuHaDinhThan(bool? value) => setStarFormulaOption(
        StarFormulaKey.luuHaOption.name,
        value,
      );

  void setDauQuanChiNamSinh(bool? value) => setStarFormulaOption(
        StarFormulaKey.dauQuanOption.name,
        value,
      );
}
