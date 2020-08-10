import 'package:hive/hive.dart';
import 'dart:math';

part 'expenditure.g.dart';

@HiveType(typeId: 0)
class Expenditure {
  //This are names for DB Columns
  static const columnId = "id";
  static const columnTitle = "title";
  static const columnAmount = "amount";
  static const columnNote = "note";
  static const columnDate = "date";
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  double amount;
  @HiveField(3)
  String note;
  @HiveField(4)
  DateTime date;
  Expenditure({this.title, this.amount, this.note, this.date})
      : id = Random().nextInt(100000000);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    if (id != null) {
      map[columnId] = id;
    }
    map[columnTitle] = title;
    map[columnAmount] = amount;
    map[columnNote] = note;
    map[columnDate] = date.toIso8601String();
    return map;
  }

  Expenditure.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    amount = map[columnAmount];
    note = map[columnNote];
    date = DateTime.parse(map[columnDate]);
  }
  String toString() =>
      'id=$id, amount=$amount, title=$title, note=$note, date=$date';
}
