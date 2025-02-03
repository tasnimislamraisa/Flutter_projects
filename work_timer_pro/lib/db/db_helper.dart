import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  Database? _database;  // Nullable database, to be initialized when needed

  DBHelper._init();  // Private constructor to ensure singleton pattern

  Future<Database> get database async {
    // Initialize the database if it's not already initialized
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB('work_time_pro.db');
      return _database!;
    }
  }

  // Initialize the database
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // Method to create tables on database creation
  void _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        role TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE sessions(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER,
        date TEXT,
        startTime TEXT,
        endTime TEXT,
        breakTime TEXT,
        totalHours TEXT,
        restaurantName TEXT,
        position TEXT
      )
    ''');
  }

  // Insert session into the database
  Future<int> insertSession(Map<String, dynamic> sessionData) async {
    final db = await database;
    return await db.insert('sessions', sessionData);
  }

  // Query with where and whereArgs
  Future<List<Map<String, dynamic>>> query(
      String table, {
        String? where,
        List<Object>? whereArgs,
      }) async {
    final db = await database;
    return db.query(table, where: where, whereArgs: whereArgs);
  }

  // Insert into any table
  Future<int> insert(String table, Map<String, dynamic> data) async {
    final db = await database;
    return db.insert(table, data);
  }

  // Update a session in the database
  Future<int> updateSession(Map<String, dynamic> session) async {
    final db = await database;
    return await db.update(
      'sessions',
      session,
      where: 'id = ?',
      whereArgs: [session['id']],
    );
  }

  // Delete a session from the database
  Future<int> deleteSession(int id) async {
    final db = await database;
    return await db.delete(
      'sessions',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
