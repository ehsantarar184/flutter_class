import '../db.dart';
import 'package:sqflite/sqflite.dart';

String tableWorkouts = "workouts";
String columnWorkoutId = "_id";
String columnWorkoutName = "name";
String columnExercises = "workoutExercises";
String columnVolumes = "workoutVolumes";

class WorkoutItem {
  String exerciseName;
  String volume;

  WorkoutItem(String _name, String _volume) {
    exerciseName = _name;
    volume = _volume;
  }
}

class Workout {
  int id;
  String name;
  List<WorkoutItem> exercises;

  Workout.fromMap(Map<String, dynamic> map) {
    id = map[columnWorkoutId];
    name = map[columnWorkoutName];
    exercises = new List<WorkoutItem>();

    List<String> exerciseNames = new List<String>();
    List<String> volumes = new List<String>();

    if (map[columnExercises] != "") {
      exerciseNames = map[columnExercises].split(';').toList();
      volumes = map[columnVolumes].split(';').toList();
    }

    for (int i = 0; i < exerciseNames.length; i++) {
      exercises.add(WorkoutItem(exerciseNames[i], volumes[i]));
    }
  }

  Map<String, dynamic> toMap() {
    var _exercises = "";
    var _volumes = "";
    if (exercises == null) exercises = new List<WorkoutItem>();
    if (exercises.length > 0) {
      _exercises = exercises.map((x) => x.exerciseName).join(";");
      _volumes = exercises.map((x) => x.volume).join(";");
    }

    var map = <String, dynamic>{
      columnWorkoutName: name,
      columnExercises: _exercises,
      columnVolumes: _volumes
    };
    if (id != null) {
      map[columnWorkoutId] = id;
    }

    return map;
  }

  Workout() {
    name = "";
    exercises = List<WorkoutItem>();
  }
}

class WorkoutsProvider {
  Future<Database> _db;

  WorkoutsProvider() {
    getDatabase();
  }

  getDatabase() async {
    _db = DBHelper.instance.getDatabase();
  }

  Future<List<Workout>> getWorkouts() async {
    Database db = await _db;
    List<Map> maps = await db.query(
      tableWorkouts,
      columns: [
        columnWorkoutId,
        columnWorkoutName,
        columnExercises,
        columnVolumes,
      ],
    );
    return maps.map((x) => Workout.fromMap(x)).toList();
  }

  Future<int> addWorkout(String workoutName) async {
    Database db = await _db;
    Workout newWorkout = Workout();
    newWorkout.name = workoutName;
    int id = await db.insert(tableWorkouts, newWorkout.toMap());
    return id;
  }

  Future<Workout> getWorkout(int id) async {
    Database db = await _db;
    List<Map> maps = await db.query(
      tableWorkouts,
      where: "$columnWorkoutId = ?",
      whereArgs: [id],
      columns: [
        columnWorkoutId,
        columnWorkoutName,
        columnExercises,
        columnVolumes,
      ],
    );
    if (maps.length > 0) return Workout.fromMap(maps.first);
    return Workout();
  }

  Future deleteWorkout(int id) async {
    Database db = await _db;
    await db.delete(
      tableWorkouts,
      where: "$columnWorkoutId = ?",
      whereArgs: [id],
    );
  }

  Future updateWorkout(Workout workout) async {
    Database db = await _db;
    await db.update(
      tableWorkouts,
      workout.toMap(),
      where: "$columnWorkoutId = ?",
      whereArgs: [workout.id],
    );
  }
}
