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
  bool firstTapTitle = true;
  bool firstTapSubTitle = true;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController titleController;
  late final TextEditingController subTitleController;
  String title = 'noTitle';
  String subTitle = 'subTitle';
  @override
  void initState() {
    super.initState();
    // setState(() {
    title = widget.title ?? widget.translate('noTitle');
    subTitle = widget.subTitle ?? widget.translate('subTitle');
    // });
    titleController = TextEditingController(text: title);
    subTitleController = TextEditingController(text: subTitle);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 0.0,
        // MediaQuery.of(context).viewInsets.bottom + 24
      ),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(labelText: widget.translate('title')),
              inputFormatters: [LengthLimitingTextInputFormatter(30)],
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.always,
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
              },
              onTap: () {
                if (firstTapTitle) {
                  titleController.clear();
                  setState(() {
                    firstTapTitle = false;
                  });
                }
              },
            ),
            TextFormField(
              controller: subTitleController,
              decoration:
                  InputDecoration(labelText: widget.translate('subTitle')),
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.always,
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
              onTap: () {
                if (firstTapSubTitle) {
                  subTitleController.clear();
                  setState(() {
                    firstTapSubTitle = false;
                  });
                }
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(widget.translate('cancel')),
                  ),
                ),
                Expanded(
                  child: FilledButton(
                    onPressed: (_formKey.currentState != null &&
                            !_formKey.currentState!.validate())
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              widget.onSubmit(widget.tagId, title, subTitle);
                              // SchedulerBinding.instance.addPostFrameCallback((_) {
                              //   Navigator.pop(context);
                              // });
                            }
                          },
                    child: Text(widget.submitButtonText),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
