import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/custom_drawer/page_tile.dart';
import 'package:xlo_mobx/store/page_store.dart';

class PageSection extends StatelessWidget {
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PageTile(
            label: "Anúncios",
            iconData: Icons.menu,
            highlighted: pageStore.page == 0,
            onTap: () {
              pageStore.setPage(0);
            }),
        PageTile(
            label: "Inserir Anúncios",
            iconData: Icons.add_circle_outline,
            highlighted: pageStore.page == 1,
            onTap: () {
              pageStore.setPage(1);
            }),
        PageTile(
            label: "Chat",
            iconData: Icons.chat_bubble_outline,
            highlighted: pageStore.page == 2,
            onTap: () {
              pageStore.setPage(2);
            }),
        PageTile(
            label: "Favoritos",
            iconData: Icons.favorite_border,
            highlighted: pageStore.page == 3,
            onTap: () {
              pageStore.setPage(3);
            }),
        PageTile(
            label: "Minha Conta",
            iconData: Icons.person_outline,
            highlighted: pageStore.page == 4,
            onTap: () {
              pageStore.setPage(4);
            })
      ],
    );
  }
}
