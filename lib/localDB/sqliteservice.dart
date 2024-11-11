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
    final String path = join(await getDatabasesPath(), 'nsamizi.db');

    return openDatabase(path, onCreate: (db, version) async {
      await db.execute('''
      CREATE TABLE IF NOT EXISTS users(
        id INTEGER PRIMARY KEY,
        name TEXT,
        contact INTEGER,
        role INTEGER,
        email TEXT
      )
    ''');

      await db.execute('''
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstname TEXT,
        surname TEXT,
        contact TEXT,
        course TEXT,
        duration TEXT,
        regno TEXT)
    ''');
      await db.execute('''
          CREATE TABLE IF NOT EXISTS expense(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          student_id TEXT,
          amount_removed TEXT,
          reason TEXT,
          user_id INTEGER
        ) ''');
      await db.execute('''
          CREATE TABLE IF NOT EXISTS student_payment_record(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          student_id TEXT,
          amount_paid INTEGER,
          fee TEXT,
          user_id INTEGER
        ) ''');
    }, version: 1);
  }

  Future<int> insertStudent(Map<String, dynamic> pdts) async {
    final db = await database;
    return await db.insert('students', pdts);
  }

  Future<int> insertUser(Map<String, dynamic> pdts) async {
    final db = await database;
    return await db.insert('students', pdts);
  }

  Future<int> insertFee(Map<String, dynamic> pdts) async {
    final db = await database;
    return await db.insert('student_payment_record', pdts);
  }

  Future<int> insertExpense(Map<String, dynamic> pdts) async {
    final db = await database;
    return await db.insert('expense', pdts);
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final db = await database;
    final List<Map<String, dynamic>> stds =
        await db.rawQuery('select * from students order by id  desc');
    return stds;
  }

  Future<List<Map<String, dynamic>>> getUser() async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery('select * from users order by id  desc limit 1');
    return items;
  }

  Future<List<Map<String, dynamic>>> fetchExpenses(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery('select * from expense where id = $id limit 1');
    return items;
  }

  Future<List<Map<String, dynamic>>> getAllExpenses() async {
    final db = await database;
    final List<Map<String, dynamic>> items =
        await db.rawQuery(' select * from expense  order by id desc');
    return items;
  }

  Future<List<Map<String, dynamic>>> getStudentPaymentRecord(id) async {
    final db = await database;
    final List<Map<String, dynamic>> items = await db.rawQuery(
        ' select * from student_payment_record where student_id = $id  order by id desc');
    return items;
  }

  Future<int> getTotalTuition(id) async {
    String param = "Tuition";
    final db = await database;
    final List<Map<String, dynamic>> items = await db.rawQuery(
        'select amount_paid from student_payment_record where student_id = $id and fee = $param');
    print(items);

    return 1;
  }

  // Future updateReminder(int id,int status) async {
  //   final db = await database;
  //   await db.rawQuery("update reminders set is_fulfilled=$status where id =$id");
  // }

  // Future<int> updateUser(Map<String, dynamic> user) async {
  //   final db = await database;
  //   return await db.update(
  //     'users',
  //     user,
  //     where: 'id = ?',
  //     whereArgs: [user['id']],
  //   );
  // }

  // Future<int> deleteCart(int id) async {
  //   final db = await database;
  //   return await db.delete(
  //     'cart',
  //     where: 'id = ?',
  //     whereArgs: [id],
  //   );
  // }
}
