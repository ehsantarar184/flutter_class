import 'dart:async';
import 'package:flutter/material.dart';
import 'package:GainZ/models/models_weight.dart';
import 'package:intl/intl.dart';

class WeightScreen extends StatefulWidget {
  WeightScreen({Key key}) : super(key: key);

  @override
  _WeightScreen createState() => _WeightScreen();
}

class _WeightScreen extends State<WeightScreen> {
  bool isLoading = true;
  List<Weight> allRecords = List<Weight>();
  List<WeekCluster> recordClusters = List<WeekCluster>();
  WeightProvider provider = WeightProvider();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
    getAllRecords();
  }

  void getAllRecords() async {
    List<Weight> all = await provider.getAllRecords();
    setState(() {
      allRecords = all;
      isLoading = false;
    });
    makeClusters();
  }

  void makeClusters() {
    List<WeekCluster> newClusters = List<WeekCluster>();

    int skip = 0;

    while (skip < allRecords.length) {
      final date = allRecords[skip].date;
      DateTime weekStart = date.subtract(Duration(days: date.weekday - 1));
      DateTime weekEnd = date.add(Duration(days: 7 - date.weekday));

      final weekClusterRecords = allRecords
          .skip(skip)
          .takeWhile((x) =>
              (x.date.isAfter(weekStart) && x.date.isBefore(weekEnd)) ||
              (x.date.day == weekStart.day &&
                  x.date.month == weekStart.month &&
                  x.date.year == weekStart.year) ||
              (x.date.day == weekEnd.day &&
                  x.date.month == weekEnd.month &&
                  x.date.year == weekEnd.year))
          .toList();

      final weekCluster = WeekCluster();
      weekCluster.records = weekClusterRecords;
      weekCluster.weekStart = weekStart;
      weekCluster.weekEnd = weekEnd;

      skip += weekCluster.records.length;
      newClusters.add(weekCluster);
    }

    setState(() => recordClusters = newClusters);
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
                hintText: "Weight",
                hintStyle: hintTextStyle,
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                Navigator.of(context).pop();
                saveWeight(value);
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
      appBar: AppBar(
        title: Text("Weight Log"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "ADD WEIGHT",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        elevation: 4,
        icon: Icon(Icons.add),
        onPressed: () => openAddModal(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : allRecords.length == 0
            ? Center(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Add new records by tapping the button below!",
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : buildClusters();
  }

  Widget buildClusters() {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 80),
      itemCount: recordClusters.length,
      itemBuilder: (context, index) => buildSingleCluster(index, context),
    );
  }

  Widget buildSingleCluster(int clusterID, BuildContext context) {
    WeekCluster cluster = recordClusters[clusterID];
    final firstDate = DateFormat("MMM d, yyyy").format(cluster.weekStart);
    final lastDate = DateFormat("MMM d, yyyy").format(cluster.weekEnd);

    final titleString = "Week #${recordClusters.length - clusterID}";
    final subtitleString = "$firstDate - $lastDate";

    final weekAvg = cluster.recordsAverage();

    final avgStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black45);
    final titleStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: 20);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      titleString,
                      textAlign: TextAlign.left,
                      style: titleStyle,
                    ),
                    Text(
                      subtitleString,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Text("Avg.: $weekAvg", style: avgStyle)
              ],
            ),
          ),
          Divider(height: 30, color: Colors.black),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: cluster.records
                  .map((x) => buildItem(
                      allRecords.indexOf(x), cluster.isElementLast(x)))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem(int elementID, bool isLast) {
    Weight weight = allRecords[elementID];
    String formatString = "EEE, MMM d, yyyy";
    if (weight.date.year == DateTime.now().year) formatString = "EEE, MMM d";
    final dateFormatted = new DateFormat(formatString).format(weight.date);

    final weightText = TextStyle(fontWeight: FontWeight.w500, fontSize: 16);
    final timeStyle = TextStyle(fontSize: 12, fontStyle: FontStyle.italic);

    return Dismissible(
      key: ValueKey(weight.id),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.endToStart)
          return deleteWeight(elementID, weight);
        return changeWeightDate(weight);
      },
      direction: DismissDirection.horizontal,
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
          onTap: () => {},
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("${weight.weight} kg", style: weightText),
                Text("$dateFormatted", style: timeStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveWeight(String weight) async {
    await provider.addWeight(weight);
    getAllRecords();
  }

  Future<bool> deleteWeight(int elementID, Weight weight) async {
    setState(() {
      allRecords.remove(weight);
      makeClusters();
    });

    Timer delayedDelete = Timer(Duration(milliseconds: 2000), () {
      provider.deleteRecord(weight.id);
    });

    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Weight record deleted"),
        duration: Duration(milliseconds: 1500),
        action: SnackBarAction(
          label: "Undo",
          textColor: Colors.white,
          onPressed: () {
            delayedDelete.cancel();
            setState(() => allRecords.insert(elementID, weight));
            makeClusters();
          },
        ),
      ),
    );

    return true;
  }

  Future<bool> changeWeightDate(Weight weight) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: weight.date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (newDate != null) {
      weight.date = newDate;
      await provider.updateRecord(weight);
      getAllRecords();
    } else
      print("why you entering null?");

    return false;
  }
}
