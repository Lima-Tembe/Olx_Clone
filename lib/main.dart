import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/screen/base/base_screen.dart';
import 'package:xlo_mobx/store/page_store.dart';
import 'package:xlo_mobx/store/user_manager_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
}

Future<void> initializeParse() async {
  await Parse().initialize("MC65B7rRLzYXz4AMMWzwxvJ0S7ZJLMIDdf8fLFeI",
      "https://parseapi.back4app.com/",
      clientKey: "ziib15QD4wj3K6y29RTbQfyhKSoaEohPf8CAunRi",
      autoSendSessionId: true,
      debug: true,
      coreStore: await CoreStoreSembastImp.getInstance(password: 'xlo_clone'));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.blueAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(elevation: 0)),
      home: BaseScreen(),
    );
  }
}
