import 'package:app14_frase_preferencias/model/Annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnnotationHelper {
  static final String tableName = "anotacao";

  static final AnnotationHelper _annotationHelper = AnnotationHelper._internal();
  Database _database;

  factory AnnotationHelper() {
    return _annotationHelper;
  }

  AnnotationHelper._internal() {}

  get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await startDB();
      return _database;
    }
  }

  _onCreate(Database db, int version) async {
    String sql = "CREATE TABLE $tableName ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "title VARCHAR, "
        "date DATETIME)";
    await db.execute(sql);
  }

  startDB() async {
    final databasePath = await getDatabasesPath();
    final directoryDatabase =
    join(databasePath, "banco_minhas_anotacoes.db");

    var db =
    await openDatabase(directoryDatabase, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> saveAnnotation(Annotation annotation) async {
    var aDatabase = await database;
    int result = await aDatabase.insert(tableName, annotation.toMap());
    return result;
  }

  recoverAnnotations() async {
    var aDatabase = await database;
    String sql = "SELECT * FROM $tableName ORDER BY data DESC ";
    List annotations = await aDatabase.rawQuery(sql);
    return annotations;
  }

  Future<int> updateAnnotation(Annotation annotation) async {
    var aDatabase = await database;
    return await aDatabase.update(tableName, annotation.toMap(),
        where: "id = ?", whereArgs: [annotation.id]);
  }

  Future<int> removeAnnotation(int id) async {
    var aDatabase = await database;
    return await aDatabase
        .delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}