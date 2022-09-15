import 'package:get/get.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';
import 'package:nutritionanalysis/model/NutrientsModel.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? db;
  static final int _version = 1;
  static final String _tablename = "Nutrients";
  static final String _lastWeek = "LastWeek";

  static var _Nutrients = Get.put(NutrientsController());

  static Future<void> initDb() async {
    if (db != null) {
      return;
      //_createDb(db,_version);
    }
    try {
      String _path = await getDatabasesPath() + 'task.db';
      db = await openDatabase(_path, version: _version,
          onCreate: (db, _version) async {
        print("creating a new one");
        await db.execute('''CREATE TABLE $_tablename(
        id INTEGER PRIMARY KEY AUTOINCREMENT, calories DOUBLE , carb DOUBLE , titles String);''');
        return db.execute('''CREATE TABLE $_lastWeek(
        id INTEGER PRIMARY KEY AUTOINCREMENT, calories DOUBLE , carb DOUBLE , titles String);''');
      });
      // print("database initilize");
    } catch (e) {
      // print(e);
    }
  }
//  void _createDb(Database db, int newVersion) async {
//  await db.execute('''CREATE TABLE $_tablename(
//         id INTEGER PRIMARY KEY AUTOINCREMENT, calories DOUBLE , carb DOUBLE , titles String);''');

//  await db.execute('''CREATE TABLE $_tablename(
//         id INTEGER PRIMARY KEY AUTOINCREMENT, calories DOUBLE , carb DOUBLE , titles String);''');

//   }
  static Future<int?> insert(
      NutrientsModel? nutrients, String _tablename) async {
    // print("insert function called");
    await db?.insert(_tablename, NutrientsModel.tojson(model: nutrients));
    //_Nutrients.getNutrients();
    return 1;
  }

  static Future<List<Map<String, dynamic>>> query() async {
    // print("query function called");
    return await db!.query(_tablename);
  }

  static Future<List<Map<String, Object?>>> queryRow(int id) async {
    // print("query function called");
    return await db!.rawQuery('SELECT * FROM $_tablename WHERE id =?', [id]);
  }

  static Future<int> update({NutrientsModel? nutrientsModel}) {
    // print("chal bhaiii");
    // print(_Nutrients.caloriess);
    // print(nutrientsModel!.calories);
    double newCalories = _Nutrients.caloriess + nutrientsModel!.calories;
    double newCarb = _Nutrients.carbss + nutrientsModel.carb;
    // print("new values ${newCalories}");
    String titless = nutrientsModel.titles!.join(',');
    var res = db!.update(_tablename,
        {"calories": newCalories, "carb": newCarb, "titles": titless},
        where: "id = ?", whereArgs: [1]);
    // NutrientsController controller=NutrientsController();
    //  _Nutrients.getNutrients();
    return res;
  }

  static Future<int> ResetNutrientsCounter() {
    var res = db!.update(
        _tablename, {"calories": 0.0, "carb": 0.0, "titles": ""},
        where: "id = ?", whereArgs: [1]);
    //  NutrientsController controller=NutrientsController();
    _Nutrients.getNutrients();
    return res;
  }

  // static delete(task t) async {
  //   await db!.delete(_tablename, where: 'id=?', whereArgs: [t.id]);
  // }

//   static update(int id) async {
//     return await db!.rawUpdate('''
//       update tasks SET isCompleted=?
//       WHERE id =?
// ''', [1, id]);

//   }

}
