import 'package:flutter/material.dart';

class SearchBoxWidget<U> extends StatefulWidget {
  const SearchBoxWidget({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onSearch,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(String query) onSearch;

  @override
  State<StatefulWidget> createState() => _SearchBoxWidgetstate();
}

class _SearchBoxWidgetstate extends State<SearchBoxWidget> {
  TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.addListener(listenToController);
  }

  void listenToController() {
    setState(() {});
  }

  @override
  void dispose() {
    controller.removeListener(listenToController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: widget.onSearch,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: widget.colorScheme.background.withOpacity(0.6),
        contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
        border: OutlineInputBorder(
            // borderSide: BorderSide.,
            borderRadius: BorderRadius.circular(20)),
        labelText: widget.translate('search'),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: controller.text.isEmpty
            ? null
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  controller.clear();
                  widget.onSearch('');
                },
              ),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
    );
  }
}
