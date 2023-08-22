import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lasotuvi_domain/lasotuvi_domain.dart';
import 'package:lasotuvi_provider/lasotuvi_provider.dart';
import 'package:lasotuvi_style/lasotuvi_style.dart';
import 'package:lasotuvi_tag/lasotuvi_tag.dart';
import 'package:tauari_translate/tauari_translate.dart';

import '../auth/user_auth_depended_state.dart';

class TagEditBody extends ConsumerStatefulWidget {
  const TagEditBody(this.tag, {super.key});
  final Tag tag;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagEditBodyState();
}

class _TagEditBodyState extends UserAuthDependedState<TagEditBody> {
  @override
  Widget build(BuildContext context) {
    return TagEditModal(widget.tag,
        colorScheme: LasotuviAppStyle.colorScheme,
        translate: translate,
        onSubmit: (tagId, title, subTitle) => onEditTag(
            uid: uid,
            context: context,
            tag: widget.tag.copyWith(title: title, subTitle: subTitle),
            ref: ref));
  }

  Future<void> onEditTag({
    String? uid,
    required BuildContext context,
    required Tag tag,
    required WidgetRef ref,
  }) async {
    // TODO: Consider refresh cloud
    await ref.read(updateTagProvider).call(
          uid,
          tag,
          false,
        );
    SchedulerBinding.instance.addPostFrameCallback((_) {
      context.pop();
    });
  }
}
