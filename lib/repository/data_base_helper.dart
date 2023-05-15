import 'package:busca_cep/models/estado.dart';
import 'package:busca_cep/utils/error/db_exception_imp.dart';
import 'package:sqflite/sqflite.dart';
import '../models/cidade.dart';
import '../models/endereco.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._init();
  static Database? _db;

  DataBaseHelper._init();

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await _useDatabase('busca-cep.db');
    return _db;
  }

  Future<Database> _useDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();

    return await openDatabase(
      p.join(dbPath, 'busca-cep.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE enderecos(altitude REAL, nomeCidade TEXT, sigla TEXT, longitude TEXT, latitude TEXT, complemento TEXT, cep TEXT, bairro TEXT, logradouro TEXT)');
      },
      version: 1,
    );
  }

  Future insert(Endereco endereco) async {
    final db = await instance.db;
    try {
      await db!.insert(
        'enderecos',
        {
          "altitude": endereco.altitude ?? "",
          "nomeCidade": endereco.cidade!.nome ?? "",
          "sigla": endereco.estado!.sigla ?? "",
          "longitude": endereco.longitude ?? "",
          "latitude": endereco.latitude ?? "",
          "complemento": endereco.complemento ?? "",
          "cep": endereco.cep ?? "",
          "bairro": endereco.bairro ?? "",
          "logradouro": endereco.logradouro ?? "",
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      throw DbExceptionImp(message: e.toString());
    }
  }

  Future<List<Endereco>> getEnderecos() async {
    final db = await instance.db;

    final List<Map<String, dynamic>> maps = await db!.query('enderecos');

    return List.generate(maps.length, (i) {
      return Endereco(
          altitude: maps[i]["altitude"],
          cep: maps[i]["cep"],
          cidade: Cidade(nome: maps[i]["nomeCidade"]),
          complemento: maps[i]["complemento"],
          latitude: maps[i]["latitude"],
          logradouro: maps[i]["logradouro"],
          longitude: maps[i]["longitude"],
          estado: Estado(sigla: maps[i]["sigla"]),
          bairro: maps[i]["bairro"]);
    });
  }

  Future deletetable() async {
    final db = await instance.db;

    try {
      db!.execute("DROP TABLE enderecos");

      db.execute(
          'CREATE TABLE enderecos(altitude REAL, nomeCidade TEXT, sigla TEXT, longitude TEXT, latitude TEXT, complemento TEXT, cep TEXT, bairro TEXT, logradouro TEXT)');
    } catch (e) {
      throw DbExceptionImp(message: e.toString());
    }
  }

  Future close() async {
    final db = await (instance.db as Future<Database>);
    db.close();
  }
}
