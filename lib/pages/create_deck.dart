import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CriarDeck extends StatefulWidget {
  String nomeDeck, urlImagem;

  @override
  _CriarDeckState createState() => _CriarDeckState();
}

class _CriarDeckState extends State<CriarDeck> {
  TextEditingController urlCartController = new TextEditingController();
  TextEditingController nomeDeckController = new TextEditingController();
  var urlImage = '';
  String _nomeDeck, _urlCarta, _nomeCarta;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Deck'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(hintText: 'Nome Deck'),
                  onChanged: (value) {},
                ),
                TextField(
                  decoration:
                      InputDecoration(hintText: 'Endereço url da Carta'),
                  controller: urlCartController,
                  onChanged: (value) {},
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Nome Carta'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "O campo é obrigatório";
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                Divider(),
                FlatButton(
                  color: Colors.blueAccent[100],
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Text(
                        'Procurar Imagem',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  onPressed: () {
                    buscarImage();
                  },
                ),
                Divider(),
                Container(
                  width: double.maxFinite,
                  height: 250,
                  color: Colors.black38,
                  child: Image.network(urlImage),
                ),
                Divider(),
                FlatButton(
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Salvar Deck',
                    style: TextStyle(fontSize: 22),
                  ),
                  onPressed: () => {addData(), Navigator.pop(context)},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  addData() {
    Map<String, dynamic> demoData = {
      "cartas": null,
      "id_deck": "002",
      "imagem_deck": "$_urlCarta",
      "nome": "$_nomeDeck"
    };

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('decks');
    collectionReference.add(demoData);
  }

  buscarImage() async {
    var url = "https://api.scryfall.com/cards/named?exact=$_nomeCarta";
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var imagens = json['image_uris'];
    Map cropImagem = imagens;
    var urlImagem = cropImagem.values.elementAt(4);

    setState(() {
      _urlCarta = urlImagem;
      urlImage = urlImagem;
      urlCartController.text = urlImagem;
    });
  }

  validarAlteracao() {
    nomeDeckController.text = {widget.nomeDeck}.toString();
    urlCartController.text = {widget.urlImagem}.toString();
  }
}
