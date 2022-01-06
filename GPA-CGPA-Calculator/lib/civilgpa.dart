import 'package:flutter/material.dart';
import 'sem1.dart';
import 'civsem2.dart';
import 'civsem3.dart';
import 'civsem4.dart';
import 'civsem5.dart';
import 'civsem6.dart';
import 'civsem7.dart';
import 'sem8.dart';

class First extends StatelessWidget {
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
        
        backgroundColor: Colors.black87,
      body: new Container(
        
         
             decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage('assets/images/math.jpg'),
              fit: BoxFit.cover,
    ),
  

   
),
padding: EdgeInsets.all(0),
          child : new Column(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                
                new  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                     FlatButton(
            child: Text('Sem1',style: TextStyle(fontSize:35)),
            
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sem1())
              );
            },
            color: Colors.black87..withOpacity(.5),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
            
            FlatButton(
            
            child: Text('Sem2',style: TextStyle(fontSize:35)),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CivilSem2())
              );
            },
            color: Colors.black87..withOpacity(.5),
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
            
                  ],


                ),
                new  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: <Widget>[
                     FlatButton(
            child: Text('Sem3',style: TextStyle(fontSize:35)),
           
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CivilSem3())
              );
            },
            color: Colors.black87,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
            FlatButton(
            child: Text('Sem4',style: TextStyle(fontSize:35)),
            
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CivilSem4())
              );
            },
            color: Colors.black87,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
                  ],


                ),
                new  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                     FlatButton(
            child: Text('Sem5',style: TextStyle(fontSize:35)),
           
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CivilSem5())
              );
            },
            color: Colors.black87,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
            FlatButton(
            child: Text('Sem6',style: TextStyle(fontSize:35)),
            
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CivilSem6())
              );
            },
            color: Colors.black87,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
                  ],


                ),
               new  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                     FlatButton(
            child: Text('Sem7',style: TextStyle(fontSize:35)),
           
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CivilSem7())
              );
            },
            color: Colors.black87,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
            FlatButton(
            child: Text('Sem8',style: TextStyle(fontSize:35)),
            
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sem8())
              );
            },
            color: Colors.black87,
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

