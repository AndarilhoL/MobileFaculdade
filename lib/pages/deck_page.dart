import 'package:flutter/material.dart';

class DeckPage extends StatefulWidget {
  final idDeck;

  const DeckPage({Key key, this.idDeck}) : super(key: key);
  @override
  _DeckPageState createState() => _DeckPageState();
}

class _DeckPageState extends State<DeckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seu Grimório'),
      ),
    );
  }
}
