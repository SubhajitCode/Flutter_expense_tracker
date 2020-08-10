import 'package:expense_tracker/models/expenditure.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class ExpenditureProvider {
  static Box box;
  ExpenditureProvider._() {
    initDb();
  }
  static final ExpenditureProvider tp = ExpenditureProvider._();

  Future<void> initDb() async {
    final appDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDir.path);
    Hive.registerAdapter(ExpenditureAdapter());
    box = await Hive.openBox('expenditureBox');
  }

  Future<Expenditure> insert(Expenditure expenditure) async {
    await box.put(expenditure.id, expenditure);
    return expenditure;
  }

  Future<List<Expenditure>> getAllExpenditure() async {
    if (box != null)
      return box.values.toList().cast<Expenditure>();
    else
      return null;
  }

  Future delete(int id) async {
    await box.delete(id);
  }
}
