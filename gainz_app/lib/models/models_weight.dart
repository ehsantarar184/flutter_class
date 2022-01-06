import '../db.dart';
import 'package:sqflite/sqflite.dart';

final String tableWeight = "weightLogs";
final String columnWeightId = "_id";
final String columnWeight = "weight";
final String columnDate = "date";

class WeekCluster {
  List<Weight> records;
  DateTime weekStart;
  DateTime weekEnd;

  WeekCluster();

  String recordsAverage() {
    return (records
                .map((record) => record.weight)
                .reduce((acc, curr) => acc + curr) /
            records.length)
        .toStringAsFixed(2);
  }

  bool isElementLast(Weight element) {
    return records.indexOf(element) == records.length - 1;
  }
}

class Weight {
  int id;
  double weight;
  DateTime date;

  Weight.fromMap(Map<String, dynamic> map) {
    id = map[columnWeightId];
    weight = double.parse(map[columnWeight]);
    date = DateTime.fromMillisecondsSinceEpoch(int.parse(map[columnDate]));
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnWeight: weight.toString(),
      columnDate: date.millisecondsSinceEpoch.toString(),
    };
    if (id != null) {
      map[columnWeightId] = id;
    }
    return map;
  }

  Weight();
}

class WeightProvider {
  Future<Database> _db;

  WeightProvider() {
    getDatabase();
  }

  getDatabase() async {
    _db = DBHelper.instance.getDatabase();
  }

  Future<List<Weight>> getAllRecords() async {
    Database db = await _db;
    List<Map> maps = await db.query(
      tableWeight,
      columns: [columnWeightId, columnWeight, columnDate],
      orderBy: "$columnDate DESC",
    );
    return maps.map((x) => Weight.fromMap(x)).toList();
  }

  Future<int> addWeight(String weightStr) async {
    Database db = await _db;
    Weight newWeight = Weight();
    newWeight.weight = double.parse(weightStr);
    newWeight.date = new DateTime.now();
    int id = await db.insert(tableWeight, newWeight.toMap());
    return id;
  }

  Future deleteRecord(int id) async {
    Database db = await _db;
    await db.delete(tableWeight, where: "$columnWeightId = ?", whereArgs: [id]);
  }

  Future updateRecord(Weight weight) async {
    Database db = await _db;
    await db.update(
      tableWeight,
      weight.toMap(),
      where: "$columnWeightId == ?",
      whereArgs: [weight.id],
    );
  }
}
