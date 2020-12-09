import 'package:crup_api/pages/alterar_deck.dart';
import 'package:crup_api/pages/create_deck.dart';
import 'package:crup_api/pages/decks_pages.dart';
import 'package:crup_api/pages/login_page.dart';
import 'package:crup_api/services/verificar_email.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/deck-page': (context) => DecksPage(),
        '/create-deck': (context) => CriarDeck(),
        '/verificar-email': (context) => VerificarEmail(),
        '/update-deck': (context) => AlterarDeck(
              idDeck: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
