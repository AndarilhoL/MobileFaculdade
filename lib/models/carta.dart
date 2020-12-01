class Carta {
  String idCarta;
  String nome;
  String urlCarta;

  Carta({this.idCarta, this.nome, this.urlCarta});

  Carta.fromJson(Map<String, dynamic> json) {
    idCarta = json['id_carta'];
    nome = json['nome'];
    urlCarta = json['url_carta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_carta'] = this.idCarta;
    data['nome'] = this.nome;
    data['url_carta'] = this.urlCarta;
    return data;
  }
}
