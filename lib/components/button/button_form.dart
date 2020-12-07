import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({Key key, this.text, this.onPressed, this.disabledColor}) : super(key: key);
  final String text;
  final VoidCallback onPressed;
  final Color disabledColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: RaisedButton(
        onPressed: onPressed,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text('$text'),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        disabledColor: disabledColor,
      ),
    );
  }
}
