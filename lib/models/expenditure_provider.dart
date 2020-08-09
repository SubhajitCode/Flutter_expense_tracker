import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'expenditure.dart';

class ExpenditureProvider {
  ExpenditureProvider._();
  static final ExpenditureProvider tp = ExpenditureProvider._();
  static const tableName = "expenses";
  Database _database;

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $tableName (
        ${Expenditure.columnId} INTEGER PRIMARY KEY,
        ${Expenditure.columnTitle} TEXT NOT NULL,
        ${Expenditure.columnAmount} REAL NOT NULL,
        ${Expenditure.columnNote} TEXT,
        ${Expenditure.columnDate} TEXT
        )
      ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute(
          "ALTER TABLE $tableName ADD COLUMN ${Expenditure.columnDate} TEXT ;");
    }
  }

  Future<Database> get database async {
    if (_database != null) return _database;
    String path = join(await getDatabasesPath(), "my_expenses.db");
    _database = await openDatabase(path,
        version: 2, onCreate: _onCreate, onUpgrade: _onUpgrade);
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

  Future<int> delete(int id) async {
    Database db = await database;
    return db.delete(tableName, where: "id=?", whereArgs: [id]);
  }

  Future close() async => _database.close();
}
