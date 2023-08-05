import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'simple_dialog_header.dart';

class BasicConfirmDialog extends StatelessWidget {
  const BasicConfirmDialog({
    super.key,
    required this.title,
    required this.children,
    required this.cancelButtonText,
    required this.noButtonText,
    required this.yesButtonText,
  });
  final String title;
  final List<Widget> children;
  final String? cancelButtonText;
  final String? noButtonText;
  final String yesButtonText;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: SimpleDialogHeader(title),
      titlePadding:
          const EdgeInsets.only(left: 12.0, top: 8.0, right: 8.0, bottom: 0.0),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      children: [
        ...children,
        const SizedBox(
          height: 32.0,
        ),
        const Divider(
          height: 1.0,
          thickness: 1.0,
        ),
        Row(
          children: [
            if (cancelButtonText != null)
              Expanded(
                child: TextButton(
                    onPressed: () => Navigator.pop(
                          context,
                          const ConfirmResult(
                            cancel: true,
                            no: false,
                            yes: false,
                          ),
                        ),
                    child: Text(cancelButtonText!)),
              ),
            if (noButtonText != null)
              Expanded(
                child: TextButton(
                    onPressed: () => SchedulerBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          Navigator.pop(
                            context,
                            const ConfirmResult(
                              cancel: false,
                              no: true,
                              yes: false,
                            ),
                          );
                        }),
                    child: Text(noButtonText!)),
              ),
            Expanded(
              child: TextButton(
                  onPressed: () => Navigator.pop(
                        context,
                        const ConfirmResult(
                          cancel: false,
                          no: false,
                          yes: true,
                        ),
                      ),
                  child: Text(yesButtonText)),
            ),
          ],
        )
      ],
    );
  }
}

class ConfirmResult {
  const ConfirmResult({
    required this.cancel,
    required this.no,
    required this.yes,
  });
  final bool cancel;
  final bool no;
  final bool yes;
}
