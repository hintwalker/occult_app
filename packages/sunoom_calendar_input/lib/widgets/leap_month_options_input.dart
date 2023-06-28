part of sunoom_calendar_input;

class LeapMonthOptionsInput extends StatefulWidget {
  const LeapMonthOptionsInput(
    this.controller, {
    super.key,
    this.translate,
    this.colorScheme,
  });
  final LeapMonthOptionsController controller;
  final String Function(String)? translate;
  final ColorScheme? colorScheme;

  @override
  State<StatefulWidget> createState() => _LeapMonthOptionsInputState();
}

class _LeapMonthOptionsInputState extends State<LeapMonthOptionsInput> {
  final groupController = GroupButtonController();
  late bool _show;
  void onStateChanged() {
    setState(() {
      _show = widget.controller.show;
    });
    groupController.selectIndex(widget.controller.isLeapMonth ? 1 : 0);
  }

  @override
  void initState() {
    super.initState();
    _show = false;
    groupController.selectIndex(0);
    widget.controller.addListener(onStateChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onStateChanged);
    super.dispose();
  }

  final buttons = ['normal_month', 'leap_month'];

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: _show,
        child: GroupButton(
          controller: groupController,
          isRadio: true,
          // onSelected: (value, index, isSelected) {
          //   ref.read(chartCreationNotifierProvider.notifier).updateGender(value);
          // },
          buttons: buttons,
          buttonBuilder: (selected, value, context) => selected
              ? ElevatedButton(
                  onPressed: () {
                    groupController.selectIndex(buttons.indexOf(value));
                    widget.controller.changedByUser = false;
                    widget.controller.choose(value);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: widget.colorScheme != null
                          ? widget.colorScheme!.primaryContainer
                          : Colors.blue),
                  child: Text(
                    widget.translate != null ? widget.translate!(value) : value,
                    style: TextStyle(
                      color: widget.colorScheme != null
                          ? widget.colorScheme!.onPrimaryContainer
                          : Colors.black,
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    groupController.selectIndex(buttons.indexOf(value));
                    widget.controller.changedByUser = false;
                    widget.controller.choose(value);
                  },
                  child: Text(
                    widget.translate != null ? widget.translate!(value) : value,
                  )),
          // options: GroupButtonOptions(borderRadius: BorderRadius.circular(24)),
        ));
  }
}
