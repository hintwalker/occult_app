import 'package:lasotuvi_domain/lasotuvi_domain.dart';

class CommentaryReaderBodyController {
  const CommentaryReaderBodyController({
    required this.update,
  });
  final UpdateCommentary update;

  // Future<void> save({
  //   required Commentary commentary,
  //   required String? uid,
  // }) async {
  //   await update(uid, commentary);
  //   // await ref.read(commentaryRepositoryProvider).update(commentary, uid);
  // }

  // Future<void> onChanged(Commentary commentary, WidgetRef ref, String? uid) async {
  //   ref
  //       .read(commentaryReaderCacheProvider)
  //       .whenData((value) async => await value.save(commentary));
  // }
}
