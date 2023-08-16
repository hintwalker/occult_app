import 'package:flutter/material.dart';
import 'package:tauari_data_core/tauari_data_core.dart';
import 'package:tauari_values/tauari_values.dart';

import 'list_tile/list_tile_delete_forever.dart';
import 'list_tile/list_tile_delete_from_cloud.dart';
import 'list_tile/list_tile_download.dart';
import 'list_tile/list_tile_upload.dart';

class StorageOptionsModal<T extends SyncableEntity> extends StatefulWidget {
  const StorageOptionsModal({
    super.key,
    this.uid,
    this.syncStatus,
    required this.item,
    required this.colorScheme,
    required this.translate,
    // required this.controller,
    required this.onUpload,
    required this.onDownload,
    required this.onDeleteFromCloud,
    required this.onDeleteFromLocal,
    required this.onDeleteForever,
    this.doBeforeDeleteForever,
    this.doAfterDeleteForever,
    this.callback,
  });

  final String? uid;
  final String? syncStatus;
  final T item;
  final ColorScheme colorScheme;
  final String Function(String) translate;
  // final StorageOptionsModalController controller;
  final Future<bool> Function(String?, T) onUpload;
  final Future Function(String, T) onDownload;
  final Future Function(String, T) onDeleteFromCloud;
  final Future Function(T) onDeleteFromLocal;
  final Future Function(String, T) onDeleteForever;
  final void Function()? doBeforeDeleteForever;
  final void Function()? doAfterDeleteForever;
  final void Function(String? syncStatus)? callback;

  @override
  State<StatefulWidget> createState() => _StorageOptionsModalState<T>();
}

class _StorageOptionsModalState<T extends SyncableEntity>
    extends State<StorageOptionsModal<T>> {
  String? onCloud;
  @override
  void initState() {
    super.initState();
    setState(() {
      onCloud = widget.syncStatus;
    });
  }

  @override
  void didUpdateWidget(covariant StorageOptionsModal<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      onCloud = widget.syncStatus;
    });
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> upload() async {
    // if (widget.uid != null) {
    final result = await widget.onUpload(widget.uid, widget.item);
    // await ref
    //     .read(uploaderProvider)
    //     .upload<T>(uid: widget.uid!, items: widget.items);
    if (result) {
      setState(() {
        onCloud = SyncStatus.synced;
      });
      doCallback(onCloud);
    }

    // }
  }

  Future<void> download() async {
    if (widget.uid != null) {
      await widget.onDownload(widget.uid!, widget.item);
      // await ref
      //     .read(downloaderProvider)
      //     .download<T>(uid: widget.uid!, items: widget.items);
      setState(() {
        onCloud = SyncStatus.synced;
      });
      doCallback(onCloud);
    }
  }

  Future<void> deleteFromCloud() async {
    if (widget.uid != null) {
      await widget.onDeleteFromCloud(widget.uid!, widget.item);
      // await ref
      //     .read(removerProvider)
      //     .deleteFromCloud<T>(uid: widget.uid!, items: widget.items);
      if (context.mounted) {
        setState(() {
          onCloud = SyncStatus.onlyLocal;
        });
      }

      doCallback(onCloud);
    }
  }

  Future<void> deleteFromLocal() async {
    // if (widget.uid != null) {
    await widget.onDeleteFromLocal(widget.item);
    // await ref.read(removerProvider).deleteFromLocal<T>(items: widget.items);
    setState(() {
      onCloud = SyncStatus.onlyCloud;
    });
    doCallback(onCloud);
    // }
  }

  Future<void> deleteForever() async {
    if (widget.doBeforeDeleteForever != null) {
      widget.doBeforeDeleteForever!();
    }
    if (widget.uid != null) {
      await widget.onDeleteForever(widget.uid!, widget.item);
      // await ref
      //     .read(removerProvider)
      //     .deleteForever<T>(uid: widget.uid!, items: widget.items);
    } else {
      await deleteFromLocal();
    }
    if (widget.doAfterDeleteForever != null) {
      widget.doAfterDeleteForever!();
    }
    // doCallback();
    try {
      if (context.mounted) {
        close(context);
      }
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  color: widget.colorScheme.surfaceVariant),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      widget.translate('storageOptions'),
                      style: TextStyle(
                          color: widget.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  IconButton(
                      onPressed: () => close(context),
                      icon: const Icon(Icons.close))
                ],
              )),
          ...ListTile.divideTiles(context: context, tiles: [
            if (onCloud == SyncStatus.onlyCloud)
              ListTileDownload(
                onTap: () async => await download(),
                translate: widget.translate,
              ),
            if (onCloud == SyncStatus.onlyLocal || onCloud == null)
              ListTileUpload(
                onTap: () async {
                  await upload();
                },
                translate: widget.translate,
              ),
            if (onCloud == SyncStatus.synced)
              ListTileDeleteFromCloud(
                onTap: () async {
                  await deleteFromCloud();
                },
                translate: widget.translate,
              ),
            // if (onCloud == OnCloudValues.synced)
            //   ListTileDeleteFromLocal(
            //     onTap: () async {
            //       await deleteFromLocal();
            //     },
            //     translate: widget.translate,
            //   ),
            ListTileDeleteForever(
              onTap: () {
                deleteForever();
              },
              colorScheme: widget.colorScheme,
              translate: widget.translate,
            )
          ]).toList()
        ],
      ),
    );
  }

  void doCallback(String? syncStatus) {
    if (widget.callback != null) {
      widget.callback!(syncStatus);
    }
  }
}
