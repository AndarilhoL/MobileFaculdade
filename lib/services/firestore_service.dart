import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crup_api/models/deck.dart';

class ServicosFirestore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get
  Future<List<Map<String, Deck>>> getDeck() async {
    final getDecks = await _db.collection('decks').get();
    final teste = getDecks.docs.map((doc) => doc.data()).toList();

    print(teste);
    return teste;
  }

  void getDocuments() async {
    final getDecks = await _db.collection('decks').get();
    final teste = getDecks.docs.map((doc) => doc.data()).toList();
    print(teste);
  }

  //Create

  //Update

  //Delete
}
