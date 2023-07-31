import 'package:flutter/material.dart';
// import 'package:lasotuvi_chart/lasotuvi_chart.dart';
import '../../chart_options_box_name.dart';
import '../../controller/chart_options_modal_controller.dart';
import 'package:tauari_settings/tauari_settings.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ChartOptionsModal extends StatefulWidget {
  const ChartOptionsModal({
    super.key,
    required this.colorScheme,
    required this.translate,
    // required this.controller,
    // required this.onCancel,
    // required this.onSubmit,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  // final ChartOptionsModalController controller;
  // final void Function() onCancel;
  // final void Function() onSubmit;

  @override
  State<StatefulWidget> createState() => _ChartOptionsModalSate();
}

class _ChartOptionsModalSate extends State<ChartOptionsModal> {
  ChartOptionsModalController? controller;
  @override
  void initState() {
    super.initState();
    controller = ChartOptionsModalController();
    controller!.addListener(listenToController);
    controller!.init();
  }

  void listenToController() {
    setState(() {});
  }

  @override
  void dispose() {
    controller?.removeListener(listenToController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasicBottomSheet(
      title: widget.translate('tuyChinhAnSao'),
      colorScheme: widget.colorScheme,
      bottomPanel: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
        decoration: BoxDecoration(color: widget.colorScheme.background),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
            onPressed: () => Navigator.pop(context, null),
            child: Text(
              widget.translate('cancel'),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          FilledButton(
            onPressed: onSubmit,
            child: const Text('Ok'),
          ),
        ]),
      ),
      child: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 4.0,
              right: 20.0,
              bottom: 4.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.translate('showAmSat'),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                Checkbox(
                    value: controller!.showAmSat,
                    onChanged: controller!.setShowAmSat)
              ],
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              top: 4.0,
              right: 20.0,
              bottom: 4.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.translate('showTuongTinhCircle'),
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                Checkbox(
                    value: controller!.showTuongTinhCircle,
                    onChanged: controller!.setShowTuongTinhCircle)
              ],
            ),
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.translate('canCanh'),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.dongHoaKhoa,
            onChanged: controller!.setDongHoaKhoa,
            title: Text(
              widget.translate('msgThienDongHoaKhoaOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.dongHoaKhoa,
            onChanged: controller!.setDongHoaKhoa,
            title: Text(
              widget.translate('msgThienDongHoaKyOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
            indent: 120.0,
            endIndent: 120.0,
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.thienKhoiNgo,
            onChanged: controller!.setThienKhoiNgo,
            title: Text(
              widget.translate('msgThienKhoiNgoOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.thienKhoiNgo,
            onChanged: controller!.setThienKhoiNgo,
            title: Text(
              widget.translate('msgThienKhoiSuuOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.translate('canTan'),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.nhatHoaQuyen,
            onChanged: controller!.setNhatHoaQuyen,
            title: Text(
              widget.translate('msgThaiDuongHoaQuyenOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.nhatHoaQuyen,
            onChanged: controller!.setNhatHoaQuyen,
            title: Text(
              widget.translate('msgThienLuongHoaQuyenOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.translate('canNham'),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.phuHoaKhoa,
            onChanged: controller!.setPhuHoaKhoa,
            title: Text(
              widget.translate('msgThienPhuHoaKhoaOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.phuHoaKhoa,
            onChanged: controller!.setPhuHoaKhoa,
            title: Text(
              widget.translate('msgTaPhuHoaKhoaOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.translate('vongTruongSinh'),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.truongSinhNormal,
            onChanged: controller!.setTruongSinhNormal,
            title: Text(
              widget.translate('msgTruongSinhNormalOption'),
            ),
            subtitle: Text(widget.translate('msgTruongSinhNormalSubtitle')),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.truongSinhNormal,
            onChanged: controller!.setTruongSinhNormal,
            title: Text(
              widget.translate('msgTruongSinhDifferentOption'),
            ),
            subtitle: Text(widget.translate('msgTruongSinhDifferentSubtitle')),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.translate('hoaLinh'),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.hoaTinhMao,
            onChanged: controller!.setHoaTinhMao,
            title: Text(
              widget.translate('msgHoaTinhMaoOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.hoaTinhMao,
            onChanged: controller!.setHoaTinhMao,
            title: Text(
              widget.translate('msgHoaTinhTuatOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.translate('luuHa'),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.luuHaDinhThin,
            onChanged: controller!.setLuuHaDinhThin,
            title: Text(
              widget.translate('msgLuuHaDinhThinOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.luuHaDinhThin,
            onChanged: controller!.setLuuHaDinhThin,
            title: Text(
              widget.translate('msgLuuHaDinhThanOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          const Divider(
            height: 1.0,
            thickness: 1.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              widget.translate('dauQuan'),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
          ),
          RadioListTile(
            value: true,
            groupValue: controller!.dauQuanChiNamSinh,
            onChanged: controller!.setDauQuanChiNamSinh,
            title: Text(
              widget.translate('msgDauQuanChiNamSinhOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile(
            value: false,
            groupValue: controller!.dauQuanChiNamSinh,
            onChanged: controller!.setDauQuanChiNamSinh,
            title: Text(
              widget.translate('msgDauQuanNamTyOption'),
            ),
            controlAffinity: ListTileControlAffinity.trailing,
          ),
        ],
      )),
    );
  }

  void onSubmit() {
    TauariSettings.save(chartOptionsBoxName, controller!.options);
    if (context.mounted) {
      Navigator.pop(context, controller!.options);
    }
  }
}
