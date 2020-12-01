import 'package:crup_api/models/deck.dart';
import 'package:flutter/material.dart';

class CardDecks extends StatelessWidget {
  final Deck deck;
  const CardDecks(this.deck);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(
              'https://c1.scryfall.com/file/scryfall-cards/art_crop/front/7/3/73542493-cd0b-4bb7-a5b8-8f889c76e4d6.jpg?1605281272'),
          ListTile(
            leading: Icon(Icons.arrow_drop_down_circle),
            title: const Text('Card title 1'),
            subtitle: Text(
              'Secondary Text',
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
