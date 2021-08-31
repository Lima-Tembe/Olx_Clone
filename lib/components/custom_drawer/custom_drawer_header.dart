import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screen/login/login_screen.dart';
import 'package:xlo_mobx/store/page_store.dart';
import 'package:xlo_mobx/store/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (userManagerStore.isLoggedIn)
          GetIt.I<PageStore>().setPage(4);
        else
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
      },
      child: Container(
        color: Colors.blue,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  userManagerStore.isLoggedIn
                      ? userManagerStore.user.name
                      : "Acesse a sua conta!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  userManagerStore.isLoggedIn
                      ? userManagerStore.user.email
                      : "Clique aqui",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
