// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Estado {
  String? sigla;
  Estado({
    this.sigla,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sigla': sigla,
    };
  }

  factory Estado.fromMap(Map<String, dynamic> map) {
    return Estado(
      sigla: map['sigla'] != null ? map['sigla'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Estado.fromJson(String source) =>
      Estado.fromMap(json.decode(source) as Map<String, dynamic>);
}
