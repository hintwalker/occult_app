import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:tauari_translate/tauari_translate.dart';

enum UpdateState {
  checking,
  downloading,
  installing,
  finished,
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
    this.restorationId,
  });
  final String? restorationId;

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // bool checkingUpdate = true;
  UpdateState updateState = UpdateState.checking;

  // AppUpdateInfo? _updateInfo;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Future<AppUpdateInfo> checkForUpdate() async {
    return InAppUpdate.checkForUpdate();
    // .then((info) {
    //   setState(() {
    //     _updateInfo = info;
    //   });
    // }).catchError((e) {
    //   showSnack(e.toString());
    // });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    update();
  }

  Future<void> update() async {
    final updateInfo = await checkForUpdate();
    if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
      try {
        setState(() {
          updateState = UpdateState.downloading;
        });
        final result = await InAppUpdate.startFlexibleUpdate();
        if (result == AppUpdateResult.success) {
          setState(() {
            updateState = UpdateState.installing;
          });
          await InAppUpdate.completeFlexibleUpdate();
        }
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
    setState(() {
      updateState = UpdateState.finished;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: widget.restorationId,
      child: Container(
        decoration: BoxDecoration(
          color: LasotuviAppStyle.colorScheme.background,
        ),
        child: updateState != UpdateState.finished
            ? Scaffold(
                body: SafeArea(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          translate(
                            updateState == UpdateState.checking
                                ? 'checkingUpdate'
                                : updateState == UpdateState.downloading
                                    ? 'downloadingUpdate'
                                    : updateState == UpdateState.installing
                                        ? 'installingUpdate'
                                        : '',
                          ),
                          style: TextStyle(
                            fontSize: 16.0,
                            color: LasotuviAppStyle.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        const LinearProgressIndicator()
                      ],
                    ),
                  ),
                ),
              )
            : const SplashScreenBody(),
      ),
    );
  }
}
