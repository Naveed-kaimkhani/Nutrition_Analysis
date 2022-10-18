import 'package:get/get.dart';
import 'package:nutritionanalysis/Services/NutrientsController.dart';
import 'package:nutritionanalysis/model/NutrientsModel.dart';
import 'package:sqflite/sqflite.dart';

import '../model/TodaysListFoodModel.dart';

class DbHelper {
  static Database? db;
  static const int _version = 1;
  static const String _tablename = "Nutrients";
  static const String _lastWeek = "LastWeek";
  static const String _todayfoodlist = "todayfoodlist";

  static var _Nutrients = Get.put(NutrientsController());

  static Future<void> initDb() async {
    if (db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'task.db';
      db = await openDatabase(_path, version: _version,
          onCreate: (db, _version) async {
        print("creating a new one");
        await db.execute('''CREATE TABLE $_tablename(
        id INTEGER PRIMARY KEY AUTOINCREMENT, calories DOUBLE , carb DOUBLE , titles String);''');
        await db.execute('''CREATE TABLE $_todayfoodlist(
        id INTEGER PRIMARY KEY AUTOINCREMENT, calories DOUBLE , carb DOUBLE , title String , fat DOUBLE , protein DOUBLE , image STRING);''');
        return db.execute('''CREATE TABLE $_lastWeek(
        id INTEGER PRIMARY KEY AUTOINCREMENT, calories DOUBLE , carb DOUBLE , titles String);''');
      });
    } catch (e) {}
  }

  static Future<int?> insert(
      NutrientsModel? nutrients, String _tablename) async {
    await db?.insert(_tablename, NutrientsModel.tojson(model: nutrients));
    return 1;
  }

  static Future<int?> insertToTodayList(
      TodaysListFoodModel? nutrients, String _tablename) async {
    await db?.insert(_tablename, TodaysListFoodModel.tojson(model: nutrients));
    return 1;
  }

  static Future<List<Map<String, dynamic>>> query(String? tableName) async {
    return await db!.query(tableName!);
  }

  static Future<List<Map<String, Object?>>> queryRow(int id) async {
    return await db!.rawQuery('SELECT * FROM $_tablename WHERE id =?', [id]);
  }

  static Future<int> update({NutrientsModel? nutrientsModel}) {
    double newCalories = _Nutrients.caloriess + nutrientsModel!.calories;
    double newCarb = _Nutrients.carbss + nutrientsModel.carb;
    String titless = nutrientsModel.titles!.join(',');
    var res = db!.update(_tablename,
        {"calories": newCalories, "carb": newCarb, "titles": titless},
        where: "id = ?", whereArgs: [1]);

    return res;
  }

  static Future<int> ResetNutrientsCounter() {
    var res = db!.update(
        _tablename, {"calories": 0.0, "carb": 0.0, "titles": ""},
        where: "id = ?", whereArgs: [1]);
    _Nutrients.getNutrients();
    return res;
  }

  static Future<int> removeValues(double calories, double carb) {
    var res = db!.update(
        _tablename,
        {
          "calories": _Nutrients.caloriess -= calories,
          "carb": _Nutrients.carbss -= carb,
          "titles": ""
        },
        where: "id = ?",
        whereArgs: [1]);
    _Nutrients.getNutrients();
    return res;
  }

  static Future<void> delete(TodaysListFoodModel food) async {
    await db!.delete(_todayfoodlist, where: 'id=?', whereArgs: [food.id]);
  }
}
