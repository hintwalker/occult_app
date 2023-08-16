import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lasotuvi_manual/src/notifier/manual_state_notifier.dart';
import 'package:lasotuvi_manual/src/state/manual_state.dart';
import 'package:tauari_markdown/tauari_markdown.dart';
import 'package:tauari_ui/tauari_ui.dart';

class ManualScreenContent extends ConsumerStatefulWidget {
  const ManualScreenContent({
    super.key,
    required this.colorScheme,
  });
  final ColorScheme colorScheme;

  @override
  ConsumerState<ManualScreenContent> createState() =>
      _ManualScreenContentState();
}

class _ManualScreenContentState extends ConsumerState<ManualScreenContent> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadData();
    });
  }

  Future<void> loadData() async {
    await ref.read(manualStateNotifierProvider.notifier).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(manualStateNotifierProvider);
    return state.workingState == ManualWorkingState.initial ||
            state.workingState == ManualWorkingState.loading
        ? const LoadingWidget()
        : MarkdownViewer(
            state.content,
            colorScheme: widget.colorScheme,
          );
  }
}
