import 'package:flutter/material.dart';
import 'package:GainZ/db.dart';
import 'package:GainZ/models/models_weight.dart';
import 'package:GainZ/models/models_workouts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreen createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  WeightProvider weightProvider = WeightProvider();
  List<Weight> allWeightRecords = List<Weight>();

  WorkoutsProvider workoutsProvider = WorkoutsProvider();
  List<Workout> allWorkouts = List<Workout>();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    refreshPage();
    super.initState();
  }

  void getAllWeightRecords() async {
    List<Weight> result = await weightProvider.getAllRecords();
    setState(() => allWeightRecords = result);
  }

  void getAllWorkouts() async {
    List<Workout> result = await workoutsProvider.getWorkouts();
    setState(() => allWorkouts = result);
  }

  void refreshPage() {
    getAllWeightRecords();
    getAllWorkouts();
  }

  void openAddModal() {
    TextStyle hintTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Workout name",
                hintStyle: hintTextStyle,
              ),
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                Navigator.of(context).pop();
                saveWorkout(value);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        child: Icon(Icons.add),
        onPressed: () => openAddModal(),
      ),
      appBar: AppBar(title: Text("Dashboard")),
      body: buildBody(),
    );
  }

  Widget buildChartWidget() {
    final titleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 20);
    var series = [
      charts.Series(
        id: "Weight",
        domainFn: (Weight wData, _) => wData.date,
        measureFn: (Weight wData, _) => wData.weight,
        data: allWeightRecords,
      )
    ];

    Widget chartWidget = SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: charts.TimeSeriesChart(
        series,
        primaryMeasureAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.BasicNumericTickProviderSpec(
            zeroBound: false,
          ),
        ),
        domainAxis: new charts.DateTimeAxisSpec(
          tickProviderSpec: charts.DayTickProviderSpec(increments: [7]),
          tickFormatterSpec: new charts.AutoDateTimeTickFormatterSpec(
            day: new charts.TimeFormatterSpec(
              format: 'd/M/yy',
              transitionFormat: 'd/M/yy',
              noonFormat: 'd/M/yy',
            ),
          ),
        ),
      ),
    );

    Widget fallbackWidget = Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text("No weight records yet."),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Weight", style: titleStyle),
              Text("Weight progress over time"),
            ],
          ),
        ),
        Divider(height: 30, color: Colors.black),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: allWeightRecords.length > 0 ? chartWidget : fallbackWidget,
        )
      ],
    );
  }

  Widget buildSingleWorkout(Workout workout) {
    final nameStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 16);
    final isLast = allWorkouts.length - 1 == allWorkouts.indexOf(workout);
    final _exercisesLength =
        workout.exercises == null ? 0 : workout.exercises.length;
    String lengthText = "$_exercisesLength exercises";
    if (_exercisesLength == 0) {
      lengthText = "No exercises added yet.";
    }

    return Dismissible(
      key: ValueKey(workout.id),
      onDismissed: (direction) async {
        deleteWorkout(allWorkouts.indexOf(workout), workout);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(left: 16),
        alignment: Alignment.centerLeft,
        child: IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Icon(Icons.calendar_today),
        ),
        color: Colors.yellow[800],
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.only(right: 16),
        alignment: Alignment.centerRight,
        child: IconTheme(
          data: IconThemeData(color: Colors.white),
          child: Icon(Icons.delete),
        ),
        color: Colors.red,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: isLast
              ? null
              : Border(bottom: BorderSide(width: 1, color: Colors.grey[300])),
        ),
        child: InkWell(
          onTap: () => goToWorkout(workout.id),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${workout.name}", style: nameStyle),
                  Text("$lengthText"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWorkouts() {
    final titleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 20);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Workouts", style: titleStyle),
              Text("All custom workouts"),
            ],
          ),
        ),
        Divider(height: 30, color: Colors.black),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: allWorkouts.length > 0
              ? Column(
                  children: allWorkouts
                      .map((workout) => buildSingleWorkout(workout))
                      .toList(),
                )
              : Text("No workouts have been added yet."),
        )
      ],
    );
  }

  Widget buildBody() {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 32),
      children: <Widget>[
        buildChartWidget(),
        SizedBox(height: 50),
        buildWorkouts()
      ],
    );
  }

  void goToWorkout(int id) {
    Navigator.pushNamed(context, "/workoutDetails", arguments: id)
        .then((shouldRefresh) => shouldRefresh ? refreshPage() : null);
  }

  void saveWorkout(String workoutName) async {
    await workoutsProvider.addWorkout(workoutName);
    getAllWorkouts();
  }

  void deleteWorkout(int elementID, Workout workout) async {
    setState(() {
      allWorkouts.remove(workout);
    });

    Timer delayedDelete = Timer(Duration(milliseconds: 2000), () {
      workoutsProvider.deleteWorkout(workout.id);
    });

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Workout Deleted"),
        duration: Duration(milliseconds: 1500),
        action: SnackBarAction(
          label: "Undo",
          textColor: Colors.white,
          onPressed: () {
            delayedDelete.cancel();
            setState(() => allWorkouts.insert(elementID, workout));
            getAllWorkouts();
          },
        ),
      ),
    );
  }

  void deleteDatabase() async {
    DBHelper helper = DBHelper.instance;
    await helper.deleteDB();

    Fluttertoast.showToast(
      msg: "Database deleted",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
    );

    getAllWeightRecords();
    getAllWorkouts();
  }
}
