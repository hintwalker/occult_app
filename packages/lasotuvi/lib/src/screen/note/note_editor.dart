import 'package:flutter/material.dart';
import 'package:lasotuvi_ads/lasotuvi_ads.dart';
import 'package:lasotuvi_presentation/lasotuvi_presentation.dart'
    show AppConfig, NoteEditorBody;

class NoteEditorScreen extends StatelessWidget {
  const NoteEditorScreen({
    super.key,
    required this.restorationId,
    required this.noteId,
    required this.syncStatus,
  });

  final String? restorationId;
  // final String chartId;
  final String noteId;
  final String syncStatus;

  @override
  Widget build(BuildContext context) {
    return RestorationScope(
      restorationId: restorationId,
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: LasotuviAppStyle.colorScheme.background,
        // ),
        body: SafeArea(
          child: Column(children: [
            if (AppConfig.showAds) const BannerAds(id: AndroidAdsIds.banner),
            if (AppConfig.showAds)
              const SizedBox(
                height: 2.0,
              ),
            Expanded(
              child: NoteEditorBody(
                noteId,
                syncStatus: syncStatus,
              ),
            )
            // Center(
            //   child: FilledButton(
            //       onPressed: () => drawerController.setScreenId('home'),
            //       child: const Text('Go to Home')),
            // )
          ]),
        ),
      ),
    );
  }
}
