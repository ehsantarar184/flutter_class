import 'dart:async';

import 'package:flutter/material.dart';
import '../models/models_exercises.dart';

class ExercisesScreen extends StatefulWidget {
  ExercisesScreen({Key key}) : super(key: key);

  @override
  _ExercisesScreen createState() => _ExercisesScreen();
}

class _ExercisesScreen extends State<ExercisesScreen> {
  List<Exercise> allExercises = List<Exercise>();
  bool isLoading = true;
  ExerciseProvider provider = ExerciseProvider();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
    getAllExercises();
  }

  void getAllExercises() async {
    var result = await provider.getAllExercises();
    setState(() {
      allExercises = result;
      isLoading = false;
    });
  }

  void openCreateModal() {
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
                  hintText: "Exercise name",
                  hintStyle: hintTextStyle,
                ),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                onSubmitted: (value) {
                  Navigator.of(context).pop();
                  saveNewExercise(value);
                },
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Exercises',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4,
        icon: Icon(Icons.add),
        label: Text(
          'ADD EXERCISE',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () => openCreateModal(),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : allExercises.length == 0
            ? Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Add new exercises by tapping the button below!",
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.only(bottom: 80),
                itemCount: allExercises.length,
                itemBuilder: (context, index) => buildItem(index),
              );
  }

  Widget buildItem(int elementIndex) {
    final Exercise exercise = allExercises[elementIndex];

    final String name = exercise.name;
    final String _goal = exercise.goal;
    final String goal = _goal == null ? "Goal not set." : "Goal: $_goal";
    final String _latest = exercise.latest;
    final String latest =
        _latest == null ? "Latest not set." : "Latest: $_latest";
    final String _notes = exercise.notes;
    final String notes = _notes == null ? "No notes yet." : "Notes: $_notes";

    const nameStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
    const goalStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
    const latestStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic);
    const notesStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

    final isLast = elementIndex == allExercises.length - 1;

    return Dismissible(
        key: ValueKey(exercise.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 16),
          color: Colors.red,
          child: IconTheme(
            data: IconThemeData(color: Colors.white),
            child: Icon(Icons.delete),
          ),
        ),
        onDismissed: (direction) => removeExercise(exercise, elementIndex),
        child: Container(
          decoration: BoxDecoration(
            border: isLast
                ? null
                : Border(bottom: BorderSide(width: 1, color: Colors.grey[300])),
          ),
          child: InkWell(
            onTap: () => goToExercise(exercise.id),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(name, style: nameStyle),
                  SizedBox(height: 10),
                  Text(goal, style: goalStyle),
                  Text(latest, style: latestStyle),
                  Text(notes, style: notesStyle),
                ],
              ),
            ),
          ),
        ));
  }

  // XXX: Methods
  void saveNewExercise(String exerciseName) async {
    await provider.addNewExercise(exerciseName);
    getAllExercises();
  }

  void goToExercise(int id) {
    Navigator.pushNamed(context, '/exerciseDetails', arguments: id)
        .then((shouldRefresh) => shouldRefresh ? getAllExercises() : null);
  }

  void removeExercise(Exercise exercise, int elementID) {
    setState(() => allExercises.remove(exercise));
    Timer delayedDelete = Timer(Duration(milliseconds: 2000), () {
      provider.deleteExercise(exercise.id);
    });

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Exercise deleted"),
        duration: Duration(milliseconds: 1500),
        action: SnackBarAction(
          label: "Undo",
          textColor: Colors.white,
          onPressed: () {
            delayedDelete.cancel();
            setState(() => allExercises.insert(elementID, exercise));
          },
        ),
      ),
    );
  }
}
