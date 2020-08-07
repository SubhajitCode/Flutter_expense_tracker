import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'expenditure.dart';

class ExpenditureProvider {
  static const columnId = "id";
  static const columnTitle = "title";
  static const columnAmount = "amount";
  static const columnNote = "note";
  ExpenditureProvider._();
  static final ExpenditureProvider tp = ExpenditureProvider._();
  static const tableName = "expenses";
  Database _database;

  Future<Database> get database async {
    String path = join(await getDatabasesPath(), "my_expenses.db");
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY,
        $columnTitle TEXT NOT NULL,
        $columnAmount REAL NOT NULL,
        $columnNote TEXT
        )
      ''');
    });
    return _database;
  }

  Future<Expenditure> insert(Expenditure expenditure) async {
    Database db = await database;
    expenditure.id = await db.insert(
      tableName,
      expenditure.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return expenditure;
  }

  Future<Expenditure> getExpenditure(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.query(tableName, where: 'id=?', whereArgs: [id]);
    if (maps.length > 0) {
      Expenditure expenditure = Expenditure.fromMap(maps.first);
      return expenditure;
    } else
      return null;
  }

  Future<List<Expenditure>> getAllExpenditure() async {
    Database db = await database;
    List<Map<String, dynamic>> maps =
        await db.rawQuery("Select * from $tableName");
    if (maps.length > 0) {
      List<Expenditure> expenditures =
          maps.map((map) => Expenditure.fromMap(map)).toList();
      return expenditures;
    } else
      return null;
  }
}
