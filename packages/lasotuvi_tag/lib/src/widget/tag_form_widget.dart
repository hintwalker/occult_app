import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TagFormWidget extends StatefulWidget {
  const TagFormWidget({
    super.key,
    this.tagId,
    this.title,
    this.subTitle,
    required this.colorScheme,
    required this.translate,
    required this.submitButtonText,
    required this.onSubmit,
  });

  final ColorScheme colorScheme;
  final String Function(String) translate;
  final int? tagId;
  final String? title;
  final String? subTitle;
  final String submitButtonText;
  final void Function(int? tagId, String title, String subTitle) onSubmit;

  @override
  State<TagFormWidget> createState() => _TagFormWidgetState();
}

class _TagFormWidgetState extends State<TagFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController subTitleController;
  String title = 'noTitle';
  String subTitle = 'subTitle';
  @override
  void initState() {
    super.initState();
    setState(() {
      title = widget.title ?? widget.translate('noTitle');
      subTitle = widget.subTitle ?? widget.translate('subTitle');
    });
    titleController = TextEditingController(text: title);
    subTitleController = TextEditingController(text: subTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                controller: titleController,
                decoration:
                    InputDecoration(labelText: widget.translate('title')),
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
              controller: subTitleController,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSubmit(widget.tagId, title, subTitle);
                        // SchedulerBinding.instance.addPostFrameCallback((_) {
                        //   Navigator.pop(context);
                        // });
                      }
                    },
                    child: Text(widget.submitButtonText))
              ],
            )
          ],
        ),
      ),
    );
  }
}
