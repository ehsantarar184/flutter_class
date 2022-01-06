import '../db.dart';
import 'package:sqflite/sqflite.dart';

final String tableExercises = 'exercises';
final String columnId = '_id';
final String columnExerciseName = 'exerciseName';
final String columnExerciseGoal = 'exerciseGoal';
final String columnExerciseLatest = 'exerciseLatest';
final String columnExerciseNotes = 'exerciseNotes';

class Exercise {
  int id;
  String name;
  String goal;
  String latest;
  String notes;

  Exercise() {
    name = "";
    goal = null;
    latest = null;
    notes = null;
  }

  Exercise.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnExerciseName];
    notes = map[columnExerciseNotes];
    goal = map[columnExerciseGoal];
    latest = map[columnExerciseLatest];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnExerciseName: name,
      columnExerciseGoal: goal,
      columnExerciseLatest: latest,
      columnExerciseNotes: notes
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

class ExerciseProvider {
  Future<Database> _db;

  ExerciseProvider() {
    getDatabase();
  }

  getDatabase() async {
    _db = DBHelper.instance.getDatabase();
  }

  Future<int> addNewExercise(String exerciseName) async {
    Database db = await _db;
    Exercise newExercise = Exercise();
    newExercise.name = exerciseName;
    int id = await db.insert(tableExercises, newExercise.toMap());
    return id;
  }

  Future<Exercise> getExercise(int id) async {
    Database db = await _db;
    List<Map> maps = await db.query(tableExercises,
        columns: [
          columnId,
          columnExerciseName,
          columnExerciseGoal,
          columnExerciseLatest,
          columnExerciseNotes
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) return Exercise.fromMap(maps.first);
    return null;
  }

  Future<List<Exercise>> getAllExercises() async {
    Database db = await _db;
    List<Map> maps = await db.query(
      tableExercises,
      columns: [
        columnId,
        columnExerciseName,
        columnExerciseGoal,
        columnExerciseLatest,
        columnExerciseNotes
      ],
    );
    return maps.map((f) => Exercise.fromMap(f)).toList();
  }

  void deleteExercise(int id) async {
    Database db = await _db;
    await db.delete(tableExercises, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> updateExercise(Exercise exercise) async {
    Database db = await _db;
    return await db.update(
      tableExercises,
      exercise.toMap(),
      where: "$columnId = ?",
      whereArgs: [exercise.id],
    );
  }
}
