import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'models/models_exercises.dart';
import 'models/models_weight.dart';
import 'models/models_workouts.dart';

class DBHelper {
  static final _dbName = 'WorkoutApp.db';
  static final _dbVersion = 1;

  DBHelper._privateConstructor();
  static final DBHelper instance = DBHelper._privateConstructor();

  static Database _db;
  Future<Database> get database async {
    if (_db != null) return _db;
    _db = await _initDatabase();
    return _db;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
      onOpen: _onOpen,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableExercises (
            $columnId INTEGER PRIMARY KEY,
            $columnExerciseName TEXT NOT NULL,
            $columnExerciseGoal TEXT,
            $columnExerciseLatest TEXT,
            $columnExerciseNotes TEXT
          )
    ''');

    await db.execute('''
          CREATE TABLE $tableWeight (
            $columnWeightId INTEGER PRIMARY KEY,
            $columnWeight TEXT,
            $columnDate TEXT
          )
    ''');

    await db.execute('''
          CREATE TABLE $tableWorkouts (
            $columnWorkoutId INTEGER PRIMARY KEY,
            $columnWorkoutName TEXT,
            $columnExercises TEXT,
            $columnVolumes TEXT
          )
    ''');
  }

  Future _onOpen(Database db) async {
    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableExercises (
            $columnId INTEGER PRIMARY KEY,
            $columnExerciseName TEXT NOT NULL,
            $columnExerciseGoal TEXT,
            $columnExerciseLatest TEXT,
            $columnExerciseNotes TEXT
          )
    ''');

    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableWeight (
            $columnWeightId INTEGER PRIMARY KEY,
            $columnWeight TEXT,
            $columnDate TEXT
          )
    ''');

    await db.execute('''
          CREATE TABLE IF NOT EXISTS $tableWorkouts (
            $columnWorkoutId INTEGER PRIMARY KEY,
            $columnWorkoutName TEXT,
            $columnExercises TEXT,
            $columnVolumes TEXT
          )
    ''');
  }

  Future deleteDB() async {
    await clearExercises();
    await clearWeight();
    await clearWorkouts();
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    await deleteDatabase(path);
  }

  Future clearExercises() async {
    Database db = await database;
    await db.delete(tableExercises);
  }

  Future clearWeight() async {
    Database db = await database;
    await db.delete(tableWeight);
  }

  Future clearWorkouts() async {
    Database db = await database;
    await db.delete(tableWorkouts);
  }

  Future<Database> getDatabase() async {
    return await database;
  }
}
