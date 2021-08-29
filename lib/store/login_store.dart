import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError =>
      email == null || emailValid ? null : "Email inválido";

  @observable
  String pass;

  @action
  void setPass(String value) => pass = value;

  @computed
  bool get passValid => pass != null && pass.length >= 6;
  String get passError => pass == null || passValid ? null : "Senha inválida";

  @computed
  Function get loginPressed =>
      emailValid && passValid && !loading ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, pass);
      print(user);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
