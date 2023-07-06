import 'package:flutter/material.dart';
import 'package:flutter_application_1/class/Account.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'main_app.dart';

void main() async {
  await _initHive();
  runApp(const MainApp());
}

Future<void> _initHive() async{
  await Hive.initFlutter();
  //------------------regist adapter
  Hive.registerAdapter<Account>(AccountAdapter());
  await Hive.openBox("login");
  Hive.deleteBoxFromDisk("accounts");
  await Hive.openBox("accounts");
  Hive.box("accounts").clear();
}
