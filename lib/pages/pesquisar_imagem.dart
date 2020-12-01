import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PesquisarImagem extends StatefulWidget {
  @override
  _PesquisarImagemState createState() => _PesquisarImagemState();
}

class _PesquisarImagemState extends State<PesquisarImagem> {
  // ignore: unused_field
  String _nomeCarta, _urlRetornada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolher Imagem'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Nome da carta'),
                onChanged: (value) {
                  setState(() {
                    _nomeCarta = value.trim();
                  });
                },
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
                  setState(() {});
                  buscarImage();
                },
              ),
              Divider(),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  padding: const EdgeInsets.all(15),
                  children: <Widget>[],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buscarImage() async {
    var url = "https://api.scryfall.com/cards/named?exact=$_nomeCarta";
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var imagens = json['image_uris'];
    Map cropImagem = imagens;
    var urlImagem = cropImagem.values.elementAt(4);
    _urlRetornada = urlImagem;

    return urlImagem;
  }
}
