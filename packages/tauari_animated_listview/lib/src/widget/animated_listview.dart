// import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:flutter/widgets.dart';

class AnimatedListView<T> extends StatelessWidget {
  const AnimatedListView({
    super.key,
    required this.data,
    required this.itemBuilder,
    required this.listKey,
  });
  final List<T> data;
  final Widget Function(T) itemBuilder;
  final GlobalKey<AnimatedListState>? listKey;

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: listKey,
      initialItemCount: data.length,
      itemBuilder: (context, index, animation) => itemBuilder(
        data[index],
      ),
    );
  }
}
