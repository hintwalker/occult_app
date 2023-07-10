import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_library/lasotuvi_library.dart';
import 'package:tuvi_style/tuvi_style.dart';

import '../auth/auth_depended_state.dart';

class LibraryBody extends ConsumerStatefulWidget {
  const LibraryBody({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LibraryBodyState();
}

class _LibraryBodyState extends AuthDependedState<LibraryBody> {
  @override
  Widget build(BuildContext context) {
    return StarInfoViewer(
      'tu_vi',
      themeData: AppTheme.light(),
    );
  }
}
