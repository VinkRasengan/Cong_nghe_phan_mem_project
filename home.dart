
import 'package:flutter_application_1/class/Account.dart';
import 'package:flutter_application_1/pages/login/login.dart';

import '/pages/chat.dart';
import '/pages/filter.dart';
import 'package:flutter/material.dart';
import 'package:tcard/tcard.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../components/styles.dart' as style;

List<String> images = [
  "assets/images/user1.jpg",
  "assets/images/user2.jpg",
  "assets/images/user3.jpg",
  "assets/images/user4.jpg",
  "assets/images/user5.jpg",
  "assets/images/user6.jpg",
  "assets/images/user7.jpg",
  "assets/images/user8.jpg",
  "assets/images/user9.jpg",
  "assets/images/user10.jpg",
  "assets/images/user11.jpg",
];
List<Account> accounts=[];
class Home extends StatefulWidget {
  static const String id = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TCardController _controller = TCardController();

  int _index = 0;
  final Box _boxLogin = Hive.box("login");
  final Box _boxAcc = Hive.box('accounts');
  late Account acc;
  late List<Widget> cards;

  @override
  void initState() {
    super.initState();
    getAccounts();
    generateCards();
    acc= _boxLogin.get('account');
  }
  void getAccounts(){
    for (var i = 0; i < _boxAcc.length; i++) {
      accounts.add(_boxAcc.getAt(i));
    }
  }
  void generateCards(){
    cards = List.generate(
    accounts.length,
    (int index) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 23.0,
              spreadRadius: -13.0,
              color: Colors.black54,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.asset(
            accounts[index].info.image,
            fit: BoxFit.cover,
          ),
        ),
      );
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(color: Colors.black87),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(30)),
          //--------------------------------search
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Search for match',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none),
            ),
          ),
        ),
        //----------------------------filter
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Filter()));
              },
              icon: const Icon(
                Icons.filter_alt_outlined,
                size: 30,
              ),
            ),
          ),
          //-----------------------------------log out
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
                  onPressed: () {
                    _boxLogin.clear();
                    _boxLogin.put("loginStatus", false);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const Login();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.logout_rounded),
                ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TCard(
              cards: cards,
              controller: _controller,
              onForward: (index, info) {
                _index = index;
                setState(() {});
                if (info.direction == SwipDirection.Right) {
                  // acc.addPersons();
                  print('like');
                }
                // print('forward');
              },
              onBack: (index, info) {
                _index = index;
                setState(() {});
                // print('back');
              },
              onEnd: () {
                // print('end');
              },
            ),
            const SizedBox(height: 20),
            _index != cards.length
                ? Container(
                    margin: const EdgeInsets.symmetric(vertical: 48.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //----------------------------back button
                        FloatingActionButton(
                          onPressed: () {
                            _controller.back();
                          },
                          heroTag: 'back',
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.arrow_back_ios_new,
                              color: style.appColor, size: 30),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 40.0)),
                        //------------------------------cancel button
                        FloatingActionButton(
                          onPressed: () {
                            _controller.forward(direction:SwipDirection.Left);
                          },
                          heroTag: 'cancel',
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.close,
                              color: style.appColor, size: 30),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 40.0)),
                        //------------------------------message button
                        FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Chat()));
                          },
                          heroTag: 'message',
                          backgroundColor: Colors.white,
                          child: const Icon(Icons.message_outlined,
                              color: style.appColor, size: 30),
                        ),
                        const Padding(padding: EdgeInsets.only(right: 40.0)),
                        //-----------------------------love button
                        FloatingActionButton(
                          onPressed: () {
                            _controller.forward(direction:SwipDirection.Right);
                          },
                          backgroundColor: Colors.white,
                          heroTag: 'like',
                          child: const Icon(Icons.favorite,
                              color: style.appColor, size: 30),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: (const Text('Swiped')),
                  )
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [],
        ),
      ),
    );
  }
}
