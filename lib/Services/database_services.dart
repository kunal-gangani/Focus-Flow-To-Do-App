import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pomodoro_todo_app/Models/todo_model.dart';

class DatabaseServices {
  DatabaseServices._();

  static final DatabaseServices databaseServices = DatabaseServices._();

  Database? _db;

  final String _toDoTable = 'todo_table';
  final String _toDoID = 'todo_id';
  final String _toDoName = 'todo_name';

  final String _completedToDoTable = 'completed_todo_table';

  final String _pomodoroToDoTable = 'pomodoro_todo_table';
  final String _workSessions = 'work_sessions';
  final String _completedSessions = 'completed_sessions';
  final String _isCompleted = 'is_completed';

  Future<void> initDB() async {
    if (_db != null) return;

    String dbPath = await getDatabasesPath();
    String path = join(dbPath, "todo.db");

    _db = await openDatabase(
      path,
      version: 2, // Incremented version to apply migrations
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $_toDoTable (
            $_toDoID INTEGER PRIMARY KEY AUTOINCREMENT,
            $_toDoName TEXT NOT NULL
          );
        ''');

        await db.execute('''
          CREATE TABLE $_completedToDoTable (
            $_toDoID INTEGER PRIMARY KEY AUTOINCREMENT,
            $_toDoName TEXT NOT NULL
          );
        ''');

        await db.execute('''
          CREATE TABLE $_pomodoroToDoTable (
            $_toDoID INTEGER PRIMARY KEY AUTOINCREMENT,
            $_toDoName TEXT NOT NULL,
            $_workSessions INTEGER NOT NULL,
            $_completedSessions INTEGER DEFAULT 0,
            $_isCompleted INTEGER DEFAULT 0
          );
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('''
            CREATE TABLE $_pomodoroToDoTable (
              $_toDoID INTEGER PRIMARY KEY AUTOINCREMENT,
              $_toDoName TEXT NOT NULL,
              $_workSessions INTEGER NOT NULL,
              $_completedSessions INTEGER DEFAULT 0,
              $_isCompleted INTEGER DEFAULT 0
            );
          ''');
        }
      },
    );
  }

  // Insert Pomodoro Todo
  Future<int> insertPomodoroTodo(
      {required ToDoModel todoModel, required int workSessions}) async {
    await initDB();
    return await _db!.insert(_pomodoroToDoTable, {
      _toDoID: todoModel.id,
      _toDoName: todoModel.title,
      _workSessions: workSessions,
      _completedSessions: 0,
      _isCompleted: 0
    });
  }

  // Fetch Pomodoro Todos
  Future<List<ToDoModel>> fetchPomodoroTodos() async {
    await initDB();
    final List<Map<String, dynamic>> maps =
        await _db!.query(_pomodoroToDoTable);
    return maps.map((e) => ToDoModel.fact(data: e)).toList();
  }

  // Update Pomodoro Progress
  Future<void> updatePomodoroProgress({required int id}) async {
    await initDB();
    final List<Map<String, dynamic>> maps = await _db!.query(
      _pomodoroToDoTable,
      where: "$_toDoID = ?",
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      int completedSessions = maps.first[_completedSessions] + 1;
      int totalSessions = maps.first[_workSessions];

      // If all sessions are completed, mark as completed
      int isCompleted = completedSessions >= totalSessions ? 1 : 0;

      await _db!.update(
        _pomodoroToDoTable,
        {
          _completedSessions: completedSessions,
          _isCompleted: isCompleted,
        },
        where: "$_toDoID = ?",
        whereArgs: [id],
      );
    }
  }

  // Delete Pomodoro Todo
  Future<int> deletePomodoroTodo({required int id}) async {
    await initDB();
    return await _db!
        .delete(_pomodoroToDoTable, where: "$_toDoID = ?", whereArgs: [id]);
  }

  // Insert Todo
  Future<int> insertTodo({required ToDoModel todoModel}) async {
    await initDB();
    return await _db!.insert(_toDoTable, todoModel.toMap());
  }

  // Fetch Todos
  Future<List<ToDoModel>> fetchTodo() async {
    await initDB();
    final List<Map<String, dynamic>> maps = await _db!.query(_toDoTable);
    return maps.map((e) => ToDoModel.fact(data: e)).toList();
  }

  // Fetch Completed Todos
  Future<List<ToDoModel>> fetchCompletedTodo() async {
    await initDB();
    final List<Map<String, dynamic>> maps =
        await _db!.query(_completedToDoTable);
    return maps.map((e) => ToDoModel.fact(data: e)).toList();
  }

  // Delete Todo
  Future<int> deleteTodo({required int id}) async {
    await initDB();
    return await _db!
        .delete(_toDoTable, where: "$_toDoID = ?", whereArgs: [id]);
  }

  // Update Todo
  Future<int> updateTodo({required ToDoModel todoModel}) async {
    await initDB();
    return await _db!.update(
      _toDoTable,
      todoModel.toMap(),
      where: "$_toDoID = ?",
      whereArgs: [todoModel.id],
    );
  }

  // Mark Todo as Completed
  Future<void> markTodoAsCompleted({required int id}) async {
    await initDB();

    // Fetch the todo from the main table
    List<Map<String, dynamic>> todo =
        await _db!.query(_toDoTable, where: "$_toDoID = ?", whereArgs: [id]);

    if (todo.isNotEmpty) {
      // Insert into completed table
      await _db!.insert(_completedToDoTable, todo.first);

      // Delete from the main table
      await _db!.delete(_toDoTable, where: "$_toDoID = ?", whereArgs: [id]);
    }
  }
}
