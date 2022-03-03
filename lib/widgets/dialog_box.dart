import 'package:flutter/material.dart';

Future<void> showMsgDialog(
    BuildContext context, String title, String body) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(body),
            ],
          ),
        ),
      );
    },
  );
}
