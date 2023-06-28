part of lasotuvi_tag;

class TagCreationWidget extends StatefulWidget {
  const TagCreationWidget({
    super.key,
    required this.colorScheme,
    required this.translate,
    required this.onCreateTag,
  });
  final ColorScheme colorScheme;
  final String Function(String) translate;
  final void Function(String title, String subTitle) onCreateTag;

  @override
  State<StatefulWidget> createState() => _TagCreationWidget();
}

class _TagCreationWidget extends State<TagCreationWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController subTitleController;
  String title = 'noTitle';
  String subTitle = 'subTitle';
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    subTitleController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TextFormField(
              decoration: InputDecoration(labelText: widget.translate('title')),
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '!';
                }
                return null;
              },
              onChanged: (value) {
                if (_formKey.currentState!.validate()) {
                  setState(
                    () => title = value,
                  );
                }
              }),
          TextFormField(
            decoration:
                InputDecoration(labelText: widget.translate('subTitle')),
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            keyboardType: TextInputType.text,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '!';
              }
              return null;
            },
            onChanged: (value) {
              if (_formKey.currentState!.validate()) {
                setState(
                  () => subTitle = value,
                );
              }
            },
          ),
          const SizedBox(
            height: 24.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onCreateTag(title, subTitle);
                      // SchedulerBinding.instance.addPostFrameCallback((_) {
                      //   Navigator.pop(context);
                      // });
                    }
                  },
                  child: Text(widget.translate('createTag')))
            ],
          )
        ],
      ),
    );
  }
}
