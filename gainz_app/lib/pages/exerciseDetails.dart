import 'package:flutter/material.dart';
import '../models/models_exercises.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final int id;
  ExerciseDetailsScreen({Key key, @required this.id}) : super(key: key);

  @override
  _ExerciseDetailsScreen createState() => _ExerciseDetailsScreen();
}

class _ExerciseDetailsScreen extends State<ExerciseDetailsScreen> {
  int exerciseID;
  Exercise exercise = Exercise();
  ExerciseProvider provider = ExerciseProvider();

  TextEditingController nameController = TextEditingController();
  TextEditingController goalController = TextEditingController();
  TextEditingController latestController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  @override
  initState() {
    super.initState();
    exerciseID = widget.id;
    getExercise();
  }

  void getExercise() async {
    Exercise _exercise = await provider.getExercise(exerciseID);
    setState(() {
      exercise = _exercise;
      nameController.text = _exercise.name;
      goalController.text = _exercise.goal;
      latestController.text = _exercise.latest;
      notesController.text = _exercise.notes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exercise details"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () async {
            await updateExercise();
            Navigator.pop(context, true);
          },
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
        child: ListView(children: <Widget>[buildBody()]),
      ),
    );
  }

  Widget buildBody() {
    final nameStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
    final title = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.sentences,
              style: nameStyle,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Exercise name",
              ),
            ),
          ),
          Divider(height: 16, color: Colors.black),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Goal", style: title),
                TextField(
                  controller: goalController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Exercise goal",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Latest", style: title),
                TextField(
                  controller: latestController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Exercise latest",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Notes", style: title),
                TextField(
                  controller: notesController,
                  keyboardType: TextInputType.multiline,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Exercise notes",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<int> updateExercise() async {
    exercise.name = nameController.text;
    exercise.goal = goalController.text;
    exercise.latest = latestController.text;
    exercise.notes = notesController.text;
    if (exercise.name == "") exercise.name = "No name set";
    if (exercise.goal == "") exercise.goal = null;
    if (exercise.latest == "") exercise.latest = null;
    if (exercise.notes == "") exercise.notes = null;
    return provider.updateExercise(exercise);
  }
}
