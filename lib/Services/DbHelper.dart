// import 'package:sqflite/sqflite.dart';
// class DbHelper {
//   static Database? db;
//   static final int _version = 1;
//   static final String _tablename = "Nutrients";

//   static Future<void> initDb() async {
//     if (db != null) {
//       return;
//     }
//     try {
//       String _path = await getDatabasesPath() + 'Nutrients.db';
//       db = await openDatabase(_path, version: _version,
//           onCreate: (db, _version) {
//         print("creating a new one");
//         return db.execute('''CREATE TABLE $_tablename(
//         id INTEGER PRIMARY KEY AUTOINCREMENT, 
//             calories double , 
//             carbs double ,  
//             todays_food String
//            );''');
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   static Future<int?> insert(task? Task) async {
//     print("insert function called");
//     return await db?.insert(_tablename, Task!.tojson()) ?? 1;
//   }

//   static Future<List<Map<String, dynamic>>> query() async {
//     print("query function called");
//     return await db!.query(_tablename);
//   }

//   static delete(task t) async {
//     await db!.delete(_tablename, where: 'id=?', whereArgs: [t.id]);
  
//   }

//   static update(int id) async {
//     return await db!.rawUpdate('''
//       update tasks SET isCompleted=?
//       WHERE id =?
// ''', [1, id]);

//   }
  
// }