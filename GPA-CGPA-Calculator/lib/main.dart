import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'csemain.dart';
import 'mechmain.dart';
import 'civilmain.dart';
void main()
{
    var first=MainPage();
    
    
    runApp(MaterialApp(
      initialRoute:'/',
      routes: {
        '/':(context) => first,
      
        
      },
    
    ));
}
class MainPage extends StatefulWidget {
  @override
  A createState() => A();
}
 
class A extends State {
 
  // Default Drop Down Item.
  String value1 = 'CSE';
  String s=' ';
 List <String> dept = ['CSE','MECH','CIVIL','EEE','ECE'];
  // To show Selected Item in Text.
  
  void getDropDownItem(){
 
    setState(() {
      s=value1;
      if(s=='MECH')
      {
        s=' ';
        Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new MECHMainPage();
              }));
      }
      if(s=='CSE')
      {
        s=' ';
        Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new CSEMainPage();
              }));
      }
      if(s=='CIVIL')
      {
        s=' ';
        Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new CIVILMainPage();
              }));
      }

    });
  }
 
  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/images/clg.jpg'),
              fit: BoxFit.cover,
    ),
  ),
        padding: new EdgeInsets.all(32.0),
          child : new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
              children: <Widget>[
                SizedBox(height:70),
                new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child : 
            //Printing Item on Text Widget
            Text('Anna University Affiliated', style: TextStyle(fontSize: 30, color: Colors.white,fontWeight: FontWeight.bold))),
                ],
                ),
                SizedBox(height:15),
                new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
            padding: EdgeInsets.only(top: 29, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('GPA  and CGPA Calculator', style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold))),
                ],
                ),
                 new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
            padding: EdgeInsets.only(top: 30, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('Regulation 2017', style: TextStyle(fontSize: 25, color: Colors.white,fontWeight: FontWeight.bold))),
                ],
                ),
                SizedBox(height:100),
                new  Row(
                  
                   mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                  children: <Widget>[
                     Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('Choose Department', style: TextStyle(fontSize: 15, color: Colors.white))),
          DropdownButton<String>(
            value: value1,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 1,
            style: TextStyle(color: Colors.white, fontSize: 18),
            dropdownColor: Colors.transparent,
            
            onChanged: (String data) {
              setState(() {
                value1 = data;
              });
            },
            items: dept.map<DropdownMenuItem<String>>((String value) {
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
            textColor: Colors.white70,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
                  ]
                ),
                 

              ],
          ),
        ),
    );
  }
}