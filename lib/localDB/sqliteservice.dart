import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = join(await getDatabasesPath(), 'adherence.db');

    return openDatabase(path, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY,
        name TEXT,
        userId INTEGER,
        role INTEGER,
        email TEXT
      )
    ''');

      await db.execute('''
      CREATE TABLE IF NOT EXISTS appointment(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        note TEXT,
        date TEXT,
        time TEXT
      )
    ''');
      await db.execute('''
          CREATE TABLE IF NOT EXISTS reminders(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          note TEXT,
          date TEXT,
          time TEXT,
          is_fulfilled INTEGER,
          type_medication TEXT,
          no_of_days INTEGER,
          user_id INTEGER) ''');
    }, version: 1);
  }



  Future<int> insertNewUser(Map<String, dynamic> pdts) async {
    final db = await database;
    return await db.insert('users', pdts);
  }

  Future<int> insertUser(Map<String, dynamic> pdts) async {
    final db = await database;
    return await db.insert('reminders', pdts);
  }

  Future<int> insertAppointment(Map<String, dynamic> pdts) async {
    final db = await database;
    return await db.insert('appointment', pdts);
  }

  Future<List<Map<String, dynamic>>> getReminders() async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery('select * from reminders order by id  desc');
    return items;
  }
  
  Future<List<Map<String, dynamic>>> getUser() async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery('select * from users order by id  desc limit 1');
    return items;
  }
  
  Future<List<Map<String, dynamic>>> fetchReminderDetail(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery('select * from reminders where id = $id limit 1');
    return items;
  }

  Future<List<Map<String, dynamic>>> getAppointments() async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery(' select * from appointment  order by id desc');
    print(items);
    return items;
  }

  Future<List<Map<String, dynamic>>> fetchConfirmedPlacedOrder() async {
    final db = await database;
    final List<Map<String, dynamic>> orders = await db.rawQuery(
        "select * from reminders where is_confirmed = 0 order by id desc");
    return orders;
  }

  Future updateConfirmedCart() async {
    final db = await database;
    await db.rawQuery("update cart set is_confirmed=1 where is_confirmed=0");
  }
  
  Future updateReminder(int id,int status) async {
    final db = await database;
    await db.rawQuery("update reminders set is_fulfilled=$status where id =$id");
  }

  Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(
      'users',
      user,
      where: 'id = ?',
      whereArgs: [user['id']],
    );
  }

  Future<int> deleteCart(int id) async {
    final db = await database;
    return await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
