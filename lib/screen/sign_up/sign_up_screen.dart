import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/components/button/button_form.dart';
import 'package:xlo_mobx/components/login/field_tile.dart';
import 'package:xlo_mobx/screen/login/login_screen.dart';
import 'package:xlo_mobx/store/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  final SignupStore signupStore = SignupStore();

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
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.nameError),
                      keyboardType: TextInputType.text,
                      onChanged: signupStore.setName,
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Email",
                    subtitle:
                        "Enviaremos um email de confirmação pra este email",
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.emailError),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onChanged: signupStore.setEmail,
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Celular",
                    subtitle: "Digite seu número",
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          prefix: Text("+258 "),
                          errorText: signupStore.phoneError),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: signupStore.setPhone,
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Senha",
                    subtitle: "Use letras, números e caracteres especiais",
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.passError),
                      obscureText: true,
                      onChanged: signupStore.setPass,
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  FieldTile(
                    title: "Confirmar Senha",
                    subtitle: "Repita a senha",
                  ),
                  Observer(builder: (_) {
                    return TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          errorText: signupStore.confirmPassError),
                      obscureText: true,
                      onChanged: signupStore.setconfirmPass,
                    );
                  }),
                  Observer(builder: (_) {
                    return ButtonForm(
                      text: "CADASTRAR",
                      disabledColor: Colors.blue.withAlpha(130),
                      onPressed: () {},
                    );
                  }),
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
