import 'package:flutter/material.dart';

class TpAlertDialog extends StatelessWidget {
  const TpAlertDialog({
    required this.title,
    required this.message,
    required this.cancelText,
    required this.onOkButton,
    this.color = Colors.blue,
    Key? key,
  }) : super(key: key);

  final String title;
  final String message;
  final String cancelText;
  final Color color;
  final Function() onOkButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        message,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            cancelText,
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            onOkButton();
          },
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 14,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
