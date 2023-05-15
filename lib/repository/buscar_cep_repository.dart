import 'dart:developer';

import 'package:busca_cep/models/endereco.dart';
import 'package:http/http.dart' as http;

import '../utils/error/cep_exception_imp.dart';

class BuscarCepRepository {
  Future<Endereco>? buscarCep(String cep) async {
    String formatCep = cep.replaceAll(RegExp('[-]'), '');

    var url = "https://www.cepaberto.com/api/v3/cep?cep=$formatCep";
    var header = {'Authorization': 'Token'};

    var response = await http.get(Uri.parse(url), headers: header);

    if (response.statusCode == 200) {
      if (response.body == '{}') {
        throw CepExceptionImp(message: 'Cep não encontrado', statusCode: 404);
      }

      log(response.body);

      Endereco endereco = Endereco.fromJson(response.body);
      return endereco;
    }

    throw CepExceptionImp(
        message: response.reasonPhrase!, statusCode: response.statusCode);
  }
}
