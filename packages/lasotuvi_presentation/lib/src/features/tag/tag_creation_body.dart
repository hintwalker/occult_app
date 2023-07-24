import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_translate/tauari_translate.dart';
import 'package:tuvi_style/tuvi_style.dart';

class TagCreationBody extends ConsumerWidget {
  const TagCreationBody({super.key, required this.doAfterCreation});
  final void Function(Tag tag)? doAfterCreation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TagCreationModal(
        colorScheme: lightColorScheme,
        translate: translate,
        onCreateTag: (title, subTitle) => onCreateTag(
            context: context, title: title, subTitle: subTitle, ref: ref));
  }

  Future<void> onCreateTag({
    required BuildContext context,
    required String title,
    required String subTitle,
    required WidgetRef ref,
  }) async {
    final now = DateTime.now();
    final tag = Tag(now.millisecondsSinceEpoch,
        title: title,
        subTitle: subTitle,
        created: now,
        modified: now.millisecondsSinceEpoch);
    await ref.read(insertTagToLocalProvider).call(tag);
    if (doAfterCreation != null) {
      doAfterCreation!(tag);
    }

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        context.pop();
      }

      // TagHelper.openTagDetail(context: context, tag: tag);
      // context.pushNamed(RouteName.tagDetail, pathParameters: {
      //   RouterParams.tagId: tagId.toString(),
      // });
    });
  }
}
