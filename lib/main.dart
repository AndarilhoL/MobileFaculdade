import 'package:crup_api/pages/create_deck.dart';
import 'package:crup_api/pages/deck_page.dart';
import 'package:crup_api/pages/home_page.dart';
import 'package:crup_api/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/home-page': (context) => HomePage(),
        '/criar-deck': (context) => CriarDeck(),
        '/deck-page': (context) => DeckPage(
              idDeck: ModalRoute.of(context).settings.arguments,
            ),
      },
      initialRoute: '/',
    );
  }
}
