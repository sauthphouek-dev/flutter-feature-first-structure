import 'package:flutter/material.dart';

class Dialogs {
  /// static method to show the [AlertDialog] with [title] and [content]
  static Future<void> showAlertDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// static method to show the [AlertDialog] with [title] and [content]
  static Future<void> showConfirmDialog({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('NO'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('YES'),
            ),
          ],
        );
      },
    );
  }
}

// call the static method
// Dialogs.showAlertDialog(context: context, title: 'title', content: 'content');
