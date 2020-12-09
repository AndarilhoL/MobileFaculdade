import 'package:flutter/material.dart';

class AlterarDeck extends StatefulWidget {
  final int idDeck;

  const AlterarDeck({Key key, this.idDeck}) : super(key: key);
  @override
  _AlterarDeckState createState() => _AlterarDeckState();
}

class _AlterarDeckState extends State<AlterarDeck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alterar Deck'),
      ),
    );
  }
}
