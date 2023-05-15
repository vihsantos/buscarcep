// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'cidade.dart';
import 'estado.dart';

class Endereco {
  Cidade? cidade;
  Estado? estado;
  double? altitude;
  String? longitude;
  String? bairro;
  String? complemento;
  String? cep;
  String? logradouro;
  String? latitude;

  Endereco({
    this.cidade,
    this.estado,
    this.altitude,
    this.longitude,
    this.bairro,
    this.complemento,
    this.cep,
    this.logradouro,
    this.latitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cidade': cidade?.toMap(),
      'estado': estado?.toMap(),
      'altitude': altitude,
      'longitude': longitude,
      'bairro': bairro,
      'complemento': complemento,
      'cep': cep,
      'logradouro': logradouro,
      'latitude': latitude,
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      cidade: map['cidade'] != null
          ? Cidade.fromMap(map['cidade'] as Map<String, dynamic>)
          : null,
      estado: map['estado'] != null
          ? Estado.fromMap(map['estado'] as Map<String, dynamic>)
          : null,
      altitude: map['altitude'] != null ? map['altitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      bairro: map['bairro'] != null ? map['bairro'] as String : null,
      complemento:
          map['complemento'] != null ? map['complemento'] as String : null,
      cep: map['cep'] != null ? map['cep'] as String : null,
      logradouro:
          map['logradouro'] != null ? map['logradouro'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Endereco.fromJson(String source) =>
      Endereco.fromMap(json.decode(source) as Map<String, dynamic>);
}
