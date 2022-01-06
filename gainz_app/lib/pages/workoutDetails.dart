import 'package:flutter/material.dart';
import 'package:GainZ/models/models_workouts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  final int id;
  WorkoutDetailsScreen({Key key, @required this.id}) : super(key: key);

  @override
  WorkoutDetailsScreenState createState() => WorkoutDetailsScreenState();
}

class WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  Workout workout;
  WorkoutsProvider workoutsProvider = WorkoutsProvider();

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getWorkout();
  }

  void getWorkout() async {
    Workout result = await workoutsProvider.getWorkout(widget.id);
    setState(() {
      workout = result;
      nameController.text = result.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout details"),
        leading: IconButton(
          icon: Icon(Icons.chevron_left),
          onPressed: () async {
            await updateWorkout();
            Navigator.pop(context, true);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Text("ADD EXERCISE"),
        icon: Icon(Icons.add),
        onPressed: () => addExerciseToWorkout(),
      ),
      body: buildBody(),
    );
  }

  Widget buildTitle() {
    final nameStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
              hintText: "Workout name",
            ),
          ),
        ),
        Divider(height: 8, color: Colors.black),
        SizedBox(height: 8)
      ],
    );
  }

  void openEditItem(WorkoutItem item) {
    int elementID = workout.exercises.indexOf(item);

    TextStyle hintTextStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    );

    final editNameController = TextEditingController.fromValue(
        TextEditingValue(text: item.exerciseName));
    final editVolumeController =
        TextEditingController.fromValue(TextEditingValue(text: item.volume));

    final volumeNode = FocusNode();

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
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  controller: editNameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Exercise name",
                    hintStyle: hintTextStyle,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (value) {
                    FocusScope.of(context).requestFocus(volumeNode);
                  },
                ),
                TextField(
                  controller: editVolumeController,
                  focusNode: volumeNode,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Exercise volume",
                    hintStyle: hintTextStyle,
                  ),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  textCapitalization: TextCapitalization.sentences,
                  onSubmitted: (value) {
                    String name = editNameController.text;
                    String volume = editVolumeController.text;
                    updateExercise(elementID, name, volume);
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildItem(WorkoutItem item) {
    bool isLast =
        workout.exercises.indexOf(item) == workout.exercises.length - 1;
    final style = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

    final mainWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
          onTap: () => {},
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: ListTile(
            title: Text(item.exerciseName, style: style),
            subtitle: Text(item.volume),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: isLast
                ? null
                : Border(bottom: BorderSide(color: Colors.black26)),
          ),
        ),
      ],
    );

    return Slidable(
      actionPane: SlidableStrechActionPane(),
      child: mainWidget,
      actions: <Widget>[
        IconSlideAction(
          caption: "Edit",
          color: Colors.black45,
          icon: Icons.more_horiz,
          onTap: () => openEditItem(item),
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: "Delete",
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => deleteItem(item),
        )
      ],
    );
  }

  Widget buildExerciseList() {
    if (workout.exercises == null) workout.exercises = new List<WorkoutItem>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: workout.exercises.map((item) => buildItem(item)).toList(),
      ),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
      child: ListView(
        padding: EdgeInsets.only(top: 16, bottom: 80),
        children: <Widget>[
          buildTitle(),
          buildExerciseList(),
        ],
      ),
    );
  }

  Future updateWorkout() async {
    workout.name = nameController.text;
    await workoutsProvider.updateWorkout(workout);
  }

  void addExerciseToWorkout() {
    final newItem = WorkoutItem("", "");
    setState(() => workout.exercises.add(newItem));
    openEditItem(newItem);
  }

  void updateExercise(int itemID, String itemName, String itemVolume) async {
    setState(() {
      workout.exercises.removeAt(itemID);
      workout.exercises.insert(itemID, WorkoutItem(itemName, itemVolume));
    });
  }

  void deleteItem(WorkoutItem item) {
    setState(() => workout.exercises.remove(item));
  }
}
