import 'package:flutter/material.dart';

// class Homepage extends StatefulWidget {
//   @override
//   _HomepageState createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//   List<ItemModel> itemsdata = [
//     ItemModel(
//       name: 'one',
//       value: 'one',
//       imgurl: "assets/images/1.png",
//     ),
//     ItemModel(
//       name: 'two',
//       value: 'two',
//       imgurl: "assets/images/2.png",
//     ),
//     ItemModel(
//       name: 'five',
//       value: 'five',
//       imgurl: "assets/images/5.png",
//     ),
//     ItemModel(
//       name: 'seven',
//       value: 'seven',
//       imgurl: "assets/images/7.png",
//     )
//   ];
//   List<ItemModel> items;
//   List<ItemModel> items2;
//   int score;
//   bool gameOver;
//   @override
//   void initState() {
//     super.initState();
//     initGame();
//   }
//
//   initGame() {
//     gameOver = false;
//     score = 0;
//     items = itemsdata.take(5).toList();
//     items2 = List<ItemModel>.from(items);
//     items.shuffle();
//     items2.shuffle();
//     itemsdata.shuffle();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (items.length == 0) gameOver = true;
//     final data= MediaQuery.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightBlueAccent,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Number match Game",
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Row(
//               children: [
//                 Text("You have 5 tries",
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 25.0,
//                 ),
//                 )
//               ],
//             ),
//             Container(
//               alignment: Alignment.center,
//               height: 50,
//               width: data.size.width/1,
//               color: Colors.lightBlueAccent,
//               child: Text("Score: $score",style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//               ),
//               ),
//
//             ),
//
//             if(!gameOver)
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: items
//                           .map((item) => Padding(
//                         padding: const EdgeInsets.all(30.0),
//                         child: Draggable<ItemModel>(
//                             data: item,
//                             feedback: Image.asset(
//                               item.imgurl,
//                               height: 100,
//                               width: 100,
//                             ),
//                             childWhenDragging: Image.asset(
//                               item.imgurl,
//                               height: 100,
//                               width: 100,
//                               colorBlendMode: BlendMode.softLight,
//                             ),
//                             child: Image.asset(
//                               item.imgurl,
//                               height: 100,
//                               width: 100,
//                             )),
//                       ))
//                           .toList(),
//                     ),
//                   ),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: items2
//                           .map((item) => Padding(
//                         padding: const EdgeInsets.all(30.0),
//                         child: DragTarget<ItemModel>(
//                           onAccept: (recivedItem) {
//                             if (item.value == recivedItem.value) {
//                               setState(() {
//                                 items.remove(recivedItem);
//                                 items2.remove(item);
//                                 score += 1;
//                               });
//                             } else {
//                               setState(() {
//                                 score += 0;
//                                 item.accepting = false;
//                               });
//                             }
//                           },
//                           onLeave: (recivedItem) {
//                             setState(() {
//                               item.accepting = false;
//                             });
//                           },
//                           onWillAccept: (recivedItem) {
//                             setState(() {
//                               item.accepting = true;
//                             });
//
//                             return true;
//                           },
//                           builder:
//                               (context, acceptedItems, rejectedItems) =>
//                               Container(
//                                 alignment: Alignment.center,
//                                 height: 100,
//                                 width: 100,
//                                 color: item.accepting
//                                     ? Colors.lightBlueAccent.shade400
//                                     : Colors.lightBlueAccent,
//                                 child: Text(
//                                   item.name,
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                         ),
//                       ))
//                           .toList(),
//                     ),
//                   ),
//                 ],
//               ),
//             if(gameOver)
//               Center(
//                   child: Image.network("https://image.freepik.com/free-vector/game-pixel-art-retro-game-style_163786-44.jpg")
//               ),
//             if (gameOver)
//               Container(
//                 width: 300,
//                 child: RaisedButton(
//                   color: Colors.redAccent,
//                   child: Text("new game"),
//                   onPressed: () {
//                     initGame();
//                     setState(() {});
//                   },
//                 ),
//               ),
//           ],
//         ),
//       ),
//       drawer: Drawer(
//         // Add a ListView to the drawer. This ensures the user can scroll
//         // through the options in the drawer if there isn't enough vertical
//         // space to fit everything.
//           child: ListView(
//             // Important: Remove any padding from the ListView.
//             padding: EdgeInsets.zero,
//             children: [
//               const DrawerHeader(
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                 ),
//                 child: Text('Select one from below'),
//               ),
//               ListTile(
//                 title: const Text('0 to 10'),
//                 onTap: () {
//                   // Update the state of the app
//                   // ...
//                   // Then close the drawer
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('A to Z'),
//                 onTap: () {
//                   // Update the state of the app
//                   // ...
//                   // Then close the drawer
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           )),
//     );
//   }
// }
//
// class ItemModel {
//   final String name;
//   final String value;
//   final String imgurl;
//   bool accepting;
//   ItemModel({this.name, this.value, this.imgurl, this.accepting = false});
// }
//
//



class Homepage1 extends StatefulWidget {
  @override
  _HomepageState1 createState() => _HomepageState1();
}

class _HomepageState1 extends State<Homepage1> {
  List<ItemModel> itemsdata = [
    ItemModel(
      name: 'N',
      value: 'N',
      imgurl: "assets/images/n.png",
    ),
    ItemModel(
      name: 'M',
      value: 'M',
      imgurl: "assets/images/m.png",
    ),
    ItemModel(
      name: 'U',
      value: 'U',
      imgurl: "assets/images/u.png",
    ),
    ItemModel(
      name: 'R',
      value: 'R',
      imgurl: "assets/images/r.png",
    )
  ];
  List<ItemModel> items;
  List<ItemModel> items2;
  int score;
  bool gameOver;
  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = itemsdata.take(5).toList();
    items2 = List<ItemModel>.from(items);
    items.shuffle();
    items2.shuffle();
    itemsdata.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items.length == 0) gameOver = true;
    final data= MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Number match Game",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Text("You have 3 tries",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 25.0,
                ),
                )
              ],
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: data.size.width/1,
              color: Colors.lightBlueAccent,
              child: Text("Score: $score",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              ),

            ),

            if(!gameOver)
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: items
                          .map((item) => Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Draggable<ItemModel>(
                            data: item,
                            feedback: Image.asset(
                              item.imgurl,
                              height: 100,
                              width: 100,
                            ),
                            childWhenDragging: Image.asset(
                              item.imgurl,
                              height: 100,
                              width: 100,
                              colorBlendMode: BlendMode.softLight,
                            ),
                            child: Image.asset(
                              item.imgurl,
                              height: 100,
                              width: 100,
                            )),
                      ))
                          .toList(),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: items2
                          .map((item) => Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: DragTarget<ItemModel>(
                          onAccept: (recivedItem) {
                            if (item.value == recivedItem.value) {
                              setState(() {
                                items.remove(recivedItem);
                                items2.remove(item);
                                score += 1;
                              });
                            } else {
                              setState(() {
                                score += 0;
                                item.accepting = false;
                              });
                            }
                          },
                          onLeave: (recivedItem) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          onWillAccept: (recivedItem) {
                            setState(() {
                              item.accepting = true;
                            });

                            return true;
                          },
                          builder:
                              (context, acceptedItems, rejectedItems) =>
                              Container(
                                alignment: Alignment.center,
                                height: 100,
                                width: 100,
                                color: item.accepting
                                    ? Colors.lightBlueAccent.shade400
                                    : Colors.lightBlueAccent,
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                        ),
                      ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            if(gameOver)
              Center(
                  child: Image.network("https://image.freepik.com/free-vector/game-pixel-art-retro-game-style_163786-44.jpg")
              ),
            if (gameOver)
              Container(
                width: 300,
                child: RaisedButton(
                  color: Colors.redAccent,
                  child: Text("new game"),
                  onPressed: () {
                    initGame();
                    setState(() {});
                  },
                ),
              ),
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Select one from below'),
              ),
              ListTile(
                title: const Text('0-10'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('A-Z'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final String imgurl;
  bool accepting;
  ItemModel({this.name, this.value, this.imgurl, this.accepting = false});
}
