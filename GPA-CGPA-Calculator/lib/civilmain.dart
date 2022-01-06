import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'civilgpa.dart';
import 'csecgpa.dart';
class CIVILMainPage extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
   

    return MaterialApp(
      theme: ThemeData(
        buttonTheme: ButtonThemeData(
          height:MediaQuery.of(context).size.height*.25,
          minWidth:MediaQuery.of(context).size.width*.50,
        ),

      ),
      
      home:Scaffold(
        
        
      body: new Container(
        
         
             decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/images/clg.jpg'),
              fit: BoxFit.cover,
    ),
    
    ),

padding: EdgeInsets.only(top:0,bottom:0),
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
                 new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
            padding: EdgeInsets.only(top: 30, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('(Civil Department)', style: TextStyle(fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold))),
                ],
                ),
                SizedBox(height:175),
                new  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                     FlatButton(
            child: Text('GPA',style: TextStyle(fontSize:35)),
            
           onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new First();
              }));
            },
            color: Colors.transparent..withOpacity(.5),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
            
            FlatButton(
            
            child: Text('CGPA',style: TextStyle(fontSize:35)),
            onPressed: () {
              Navigator.of(context).push(
                  CupertinoPageRoute<Null>(builder: (BuildContext context) {
                return new CGPA();
              }));
            },
            color: Colors.transparent..withOpacity(.5),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
            
                  ],


                ),
                
                     
           ],
          ),
        ),
      ),
    );
  }
}

