class Expenditure {
  //This are names for DB Columns
  static const columnId = "id";
  static const columnTitle = "title";
  static const columnAmount = "amount";
  static const columnNote = "note";
  int id;
  String title;
  double amount;
  String note;
  DateTime date;
  Expenditure({this.title, this.amount, this.note, this.date});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    if (id != null) {
      map[columnId] = id;
    }
    map[columnTitle] = title;
    map[columnAmount] = amount;
    map[columnNote] = note;
    return map;
  }

  Expenditure.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    amount = map[columnAmount];
    note = map[columnNote];
  }
  String toString() => 'id=$id, amount=$amount, title=$title, note=$note';
}
