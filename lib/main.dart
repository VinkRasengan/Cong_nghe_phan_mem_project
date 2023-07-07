import '/pages/login/login.dart';
import '/pages/friend_profile.dart';
import '/pages/myprofile.dart';
import '/pages/verification.dart';
import 'package:flutter/material.dart';
// import '/pages/login.dart';
import '/pages/welcome.dart';
import '/pages/home.dart';
import '/pages/tabs.dart';
import '/pages/profile.dart';
import '/pages/likes.dart';
import '/pages/inbox.dart';
import '/pages/notification.dart';
import '/pages/Filter.dart';
import '/pages/Setting.dart';
import '/pages/editProfile.dart';
import '/pages/chat.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/class/Account.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../components/styles.dart' as style;

void main() async{
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.transparent, // navigation bar color
  //   statusBarColor: Colors.black, // status bar color
  // ));
  await _initHive();
  runApp(const DateApp());
}

Future<void> _initHive() async{
  await Hive.initFlutter();
  //------------------regist adapter
  Hive.registerAdapter<Account>(AccountAdapter());
  await Hive.openBox("login");
  // Hive.deleteBoxFromDisk("accounts");
  await Hive.openBox("accounts");
  Hive.box("accounts").clear();
}
class DateApp extends StatelessWidget {
  const DateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   fontFamily: "regular",
      //   primaryColor: style.appColor,
      //   iconTheme: const IconThemeData(color: Colors.black87),
      // ),
          theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(32, 63, 129, 1.0),
        ),
      ),
      initialRoute: Login.id,
      // initialRoute: TabsExample.id,
      debugShowCheckedModeBanner: false,
      routes: {
        Welcome.id: (context) => const Welcome(),
        Login.id: (context) => const Login(),
        Home.id: (context) => const Home(),
        TabsExample.id: (context) => const TabsExample(),
        Profile.id: (context) => const Profile(),
        Inbox.id: (context) => const Inbox(),
        Likes.id: (context) => const Likes(),
        Notifications.id: (context) => const Notifications(),
        Filter.id: (context) => const Filter(),
        Setting.id: (context) => const Setting(),
        EditProfile.id: (context) => const EditProfile(),
        Chat.id: (context) => const Chat(),
        FriendProfile.id: (context) => const FriendProfile(),
        Verification.id: (context) => const Verification(),
        MyProfile.id: (context) => const MyProfile(),
      },
    );
  }
}
