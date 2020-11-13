import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo_mobx/components/button/button_form.dart';
import 'package:xlo_mobx/components/login/field_tile.dart';
import 'package:xlo_mobx/screen/login/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
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
                  FieldTile(
                    title: "Nome",
                    subtitle: "Como aparecerá em seus anúncios",
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Email",
                    subtitle:
                        "Enviaremos um email de confirmação pra este email",
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), isDense: true),
                    keyboardType: TextInputType.emailAddress,
                    autocorrect: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Celular",
                    subtitle: "Digite seu número",
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), isDense: true),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Senha",
                    subtitle: "Use letras, números e caracteres especiais",
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), isDense: true),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Confirmar Senha",
                    subtitle: "Repita a senha",
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), isDense: true),
                    obscureText: true,
                  ),
                  ButtonForm(
                    text: "CADASTRAR",
                    onPressed: () {},
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      Text(
                        "Já tenho uma conta! ",
                        style: TextStyle(fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
