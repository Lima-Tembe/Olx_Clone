import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/custom_drawer/page_tile.dart';

class PageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageTile(
            label: "Anúncios",
            iconData: Icons.menu,
            highlighted: true,
            onTap: () {}),
        PageTile(
            label: "Inserir Anúncios",
            iconData: Icons.add_circle_outline,
            highlighted: false,
            onTap: () {}),
        PageTile(
            label: "Chat",
            iconData: Icons.chat_bubble_outline,
            highlighted: false,
            onTap: () {}),
        PageTile(
            label: "Favoritos",
            iconData: Icons.favorite_border,
            highlighted: false,
            onTap: () {}),
        PageTile(
            label: "Minha Conta",
            iconData: Icons.person_outline,
            highlighted: false,
            onTap: () {})
      ],
    );
  }
}
