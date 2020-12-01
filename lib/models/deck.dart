import 'package:crup_api/models/carta.dart';
import 'dart:convert';

Deck deckFromJson(String str) => Deck.fromJson(json.decode(str));
String deckToJson(Deck data) => json.encode(data.toJson());

class Deck {
  int idDeck;
  String nome;
  List<Carta> cartas;
  String imagemDeck;

  Deck({this.cartas, this.idDeck, this.imagemDeck, this.nome});

  factory Deck.fromJson(Map<String, dynamic> json) => Deck(
        cartas: List<Carta>.from(json["cartas"].map((x) => Carta.fromJson(x))),
        idDeck: json["id_deck"],
        imagemDeck: json["imagem_deck"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "cartas": List<dynamic>.from(cartas.map((x) => x.toJson())),
        "id_deck": idDeck,
        "imagem_deck": imagemDeck,
        "nome": nome,
      };
}
