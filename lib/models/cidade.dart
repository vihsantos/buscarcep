// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Cidade {
  String? ibge;
  String? nome;
  int? ddd;

  Cidade({
    this.ibge,
    this.nome,
    this.ddd,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ibge': ibge,
      'nome': nome,
      'ddd': ddd,
    };
  }

  factory Cidade.fromMap(Map<String, dynamic> map) {
    return Cidade(
      ibge: map['ibge'] != null ? map['ibge'] as String : null,
      nome: map['nome'] != null ? map['nome'] as String : null,
      ddd: map['ddd'] != null ? map['ddd'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cidade.fromJson(String source) =>
      Cidade.fromMap(json.decode(source) as Map<String, dynamic>);
}
