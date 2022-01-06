import 'package:flutter/material.dart';
class Sem8 extends StatefulWidget {
  @override
  S8 createState() => S8();
}
 
class S8 extends State {
 
  // Default Drop Down Item.
  String value1 = 'O';
  String value2 = 'O';
  String value3=  'O';
 
  // To show Selected Item in Text.
  int count=3;
  int sum=0;
  int n=10;
  int i=0;
  int temp=0;
  double ans=0;
  List <String> grades = [
    'O', 
    'A+', 
    'A', 
    'B+', 
    'B',
    'U'
    ] ;
    List <String> s1 = ['','',''];
 
  void getDropDownItem(){
 
    setState(() {
      s1[0] = value1;
      s1[1] = value2;
      s1[2] = value3;
      while(i!=count)
      {
        switch (s1[i]) {
          case 'O':temp=10;
                   break;
          case 'A+':temp=9;
                    break;
          case 'A':temp=8;
                    break;
          case 'B+':temp=7;
                    break; 
          case 'B':temp=6;
                    break;                   
          default:temp=5;
                  break;
        }
        if(i==1)
        {
          n=n-7;
        }
        sum=sum+(temp*n);
        i++;
      }
      sum=sum*10;
      ans=sum/160;
      ans=double.parse((ans).toStringAsPrecision(4));
      sum=0;
      n=10;
      i=0;
      

    });
  }
 
  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sem8'),
        backgroundColor: Colors.black,
      ),
     body: new Container(
      decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/images/wall1.jpg'),
              fit: BoxFit.cover,
    ),
  ),
        padding: new EdgeInsets.all(32.0),
          child : new Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
              children: <Widget>[
                new  Row(
                   mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: <Widget>[
                     Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('Project Work', style: TextStyle(fontSize: 15, color: Colors.black))),
          DropdownButton<String>(
            value: value1,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 1,
            style: TextStyle(color: Colors.red, fontSize: 18),
            
            onChanged: (String data) {
              setState(() {
                value1 = data;
              });
            },
            items: grades.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
                  ],


                ),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: <Widget>[
                     Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('Professional Elective-IV', style: TextStyle(fontSize: 15, color: Colors.black))),
          DropdownButton<String>(
            value: value2,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 1,
            style: TextStyle(color: Colors.red, fontSize: 18),
            
            onChanged: (String data) {
              setState(() {
                value2 = data;
              });
            },
            items: grades.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
                  ],


                ),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                  children: <Widget>[
                     Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('Professional Elective-V', style: TextStyle(fontSize: 15, color: Colors.black))),
          DropdownButton<String>(
            value: value3,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 1,
            style: TextStyle(color: Colors.red, fontSize: 18),
            
            onChanged: (String data) {
              setState(() {
                value3 = data;
              });
            },
            items: grades.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
                  ],


                ),
                new Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                  FlatButton(
            child: Text('Calculate',style: TextStyle(fontSize:20),),
            onPressed: getDropDownItem,
            color: Colors.transparent,
            textColor: Colors.black87,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
                  ]
                ),
                 new Row(
                   mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                   Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('GPA ='+'$ans', 
            style: TextStyle
                (fontSize: 20, 
                color: Colors.black))),
 
                  ]
                ),

              ],
          ),
     ),
    );
  }
}