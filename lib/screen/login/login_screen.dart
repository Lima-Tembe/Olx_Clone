import 'package:flutter/material.dart';
import 'package:xlo_mobx/components/button/button_form.dart';
import 'package:xlo_mobx/screen/sign_up/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 9,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4),
                    child: Text(
                      "Email",
                      style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(), isDense: true),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 4),
                    child: Text(
                      "Senha",
                      style: TextStyle(
                          color: Colors.blueGrey[800],
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(), isDense: true),
                    obscureText: true,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(right: 3, top: 4),
                      child: Text(
                        "Esqueci minha senha!",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blueAccent,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  ButtonForm(
                    text: "ENTRAR",
                    onPressed: () {},
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: <Widget>[
                        Text(
                          "Não tem uma conta?",
                          style: TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => SignUpScreen()));
                          },
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
