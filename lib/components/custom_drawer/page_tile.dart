import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  const PageTile(
      {Key key, this.label, this.iconData, this.highlighted, this.onTap})
      : super(key: key);

  final String label;
  final IconData iconData;
  final bool highlighted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: highlighted ? Colors.blue : Colors.blueGrey[250],
        ),
      ),
      leading: Icon(
        iconData,
        color: highlighted ? Colors.blue : Colors.blueGrey[250],
      ),
      onTap: onTap,
    );
  }
}
