import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crup_api/pages/alterar_deck.dart';
import 'package:crup_api/pages/create_deck.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DecksPage extends StatefulWidget {
  @override
  _DecksPageState createState() => _DecksPageState();
}

class _DecksPageState extends State<DecksPage> {
  final db = FirebaseFirestore.instance;
  TextEditingController controllerNome = new TextEditingController();
  TextEditingController controllerUrl = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black26,
        ),
        title: Text(
          'Decks MTGArena',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('decks').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot ds = snapshot.data.docs[index];
                return Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.only(top: 20),
                    crossAxisCount: 1,
                    children: [
                      InkWell(
                        child: Card(
                          elevation: 2,
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              Image.network(ds['imagem_deck']),
                              Text(
                                ds['nome'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          var teste1 = ds.data().values.elementAt(1);
                          var teste2 = ds.data().values.elementAt(2);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlterarDeck(),
                            ),
                          );
                        },
                        onLongPress: () {
                          db.collection('decks').doc(ds.id).delete();
                          CupertinoAlertDialog(
                            title: Text('Deck Deletado'),
                            actions: [
                              CupertinoDialogAction(
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return SnackBar(
              content: Text('Deu Ruim'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CriarDeck(),
          ));
        },
      ),
    );
  }

  getDecks() async {
    FirebaseFirestore.instance.collection('decks').get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
      });
    });
  }
}
