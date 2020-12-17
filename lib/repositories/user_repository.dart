import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/table_keys.dart';

class UserRepository {
  Future<void> signup(User user) async {
    final parseUser = ParseUser(user.email, user.password, user.email);
    parseUser.set<String>(KeyUserName, user.name);
    parseUser.set<String>(KeyUserPhone, user.phone);
    parseUser.set(KeyUserType, user.type.index);

    await parseUser.signUp();
  }
}
