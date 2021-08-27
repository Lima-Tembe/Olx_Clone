import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/helpers/extensions.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/user_repository.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return "Campo obrigatório!";
    else
      return "Nome muito curto!";
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return "Campo obrigatório!";
    else
      return "Email inválido!";
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length == 9;
  String get phoneError {
    if (phone == null || phoneValid)
      return null;
    else if (phone.isEmpty)
      return "Campo obrigatório!";
    else
      return "Número de telefone inválido";
  }

  @observable
  String pass;

  @action
  void setPass(String value) => pass = value;

  @computed
  bool get passValid => pass != null && pass.length >= 6;
  String get passError {
    if (pass == null || passValid)
      return null;
    else if (pass.isEmpty)
      return "Campo obrigatório!";
    else
      return "Senha inválida!";
  }

  @observable
  String confirmPass;

  @action
  void setconfirmPass(String value) => confirmPass = value;

  @computed
  bool get confirmPassValid => confirmPass != null && confirmPass == pass;
  String get confirmPassError {
    if (confirmPass == null || confirmPassValid)
      return null;
    else if (confirmPass.isEmpty)
      return "Campo obrigatório!";
    else
      return "Senhas não coincidem!";
  }

  @computed
  bool get isFormValid =>
      nameValid && emailValid && phoneValid && passValid && confirmPassValid;

  @computed
  Function get signupPressed => (isFormValid && !isLoading) ? _signup : null;

  @observable
  bool isLoading = false;

  @observable
  String error;

  @action
  Future<void> _signup() async {
    isLoading = true;

    final user = User(name: name, email: email, phone: phone, password: pass);

    try {
      final resultUser = await UserRepository().signup(user);
      print(resultUser);
    } catch (e) {
      error = e;
    }

    isLoading = false;
  }
}
