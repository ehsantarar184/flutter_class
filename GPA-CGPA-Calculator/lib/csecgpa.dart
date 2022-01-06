import 'package:flutter/material.dart';
class CGPA extends StatefulWidget {
  @override
  Cgpa createState() => Cgpa();
}
 
class Cgpa extends State {
 
  List <double> credits=[25.0,24.0,24.0,24.0,25.0,25.0,22.0,16.0];
  List <double> gpas=[0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
  double total=0;
  double marks=0;
  double ans=0;
  int i=0;

 TextEditingController sem1 = new TextEditingController(text:'0');
 TextEditingController sem2 = new TextEditingController(text:'0');
 TextEditingController sem3 = new TextEditingController(text:'0');
 TextEditingController sem4 = new TextEditingController(text:'0');
 TextEditingController sem5 = new TextEditingController(text:'0');
 TextEditingController sem6 = new TextEditingController(text:'0');
 TextEditingController sem7 = new TextEditingController(text:'0');
 TextEditingController sem8 = new TextEditingController(text:'0');




 
  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      // resizeToAvoidBottomPadding:false ,
      appBar: AppBar(
        title: Text('CGPA'),
        backgroundColor: Colors.black,
      ),
     body: SingleChildScrollView(

        
        padding: new EdgeInsets.all(30),
          child : new Column(
            mainAxisAlignment:MainAxisAlignment.spaceAround ,
            crossAxisAlignment:CrossAxisAlignment.center,
              children: <Widget>[
              
                new  Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    
           
            new Flexible(child: new TextFormField(
                keyboardType:TextInputType.number ,
                controller: sem1,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem1",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),

                ),
              ),
            ],
            

                ),
                SizedBox(height:15),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                     
            new Flexible(child: new TextField(
                keyboardType:TextInputType.number ,
                controller: sem2,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem2",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),

                

                ),
              ),
          
                  ],


                ),
                SizedBox(height:15),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                  children: <Widget>[
                      new Flexible(child: new TextField(
                keyboardType:TextInputType.number ,
                controller: sem3,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem3",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),


                ),
              ),
          
                  ],


                ),
                SizedBox(height:15),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                  children: <Widget>[
                    
           new Flexible(child: new TextField(
                keyboardType:TextInputType.number ,
                controller: sem4,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem4",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),


                ),
              ),
                  ],


                ),
                SizedBox(height:15),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                  children: <Widget>[
                      new Flexible(child: new TextField(
                keyboardType:TextInputType.number ,
                controller: sem5,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem5",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),


                ),
              ),
                  ],


                ),
                SizedBox(height:15),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                  children: <Widget>[
                      new Flexible(child: new TextField(
                keyboardType:TextInputType.number ,
                controller: sem6,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem6",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),


                ),
              ),
                  ],


                ),
                SizedBox(height:15),
                new  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween  ,
                  children: <Widget>[
                      new Flexible(child: new TextField(
                keyboardType:TextInputType.number ,
                controller: sem7,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem7",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),


                ),
              ),
          
                  ],


                ),
                SizedBox(height:15),
                new Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                   new Flexible(child: new TextField(
                keyboardType:TextInputType.number ,
                controller: sem8,
                decoration: InputDecoration(
                  enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide:BorderSide(color: Colors.blueGrey) ),
                  hintText: "Enter gpa",
                  labelText: "Sem8",
                  labelStyle: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.black,
                  )
                ),


                ),
              ),
                  ]
                ),
                SizedBox(height:15),
                new Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                  FlatButton(
            child: Text('Calculate',style: TextStyle(fontSize:20),),
            
            onPressed: (){
              setState(() {
                
                gpas[0]=double.parse(sem1.text);
                gpas[1]=double.parse(sem2.text);
                gpas[2]=double.parse(sem3.text);
                gpas[3]=double.parse(sem4.text);
                gpas[4]=double.parse(sem5.text);
                gpas[5]=double.parse(sem6.text);
                gpas[6]=double.parse(sem7.text);
                gpas[7]=double.parse(sem8.text);
                for (i=0;i<8;i++) {
                  if(gpas[i]!=0)
                  {
                      marks=marks+gpas[i]*credits[i];
                      total=total+credits[i];
                  }
                  else
                  {
                    break;
                  }
                }
                ans=marks/total;
                ans=double.parse((ans).toStringAsPrecision(4));
                marks=0;
                total=0;
                
                
              });
            } ,
            color: Colors.transparent,
            textColor: Colors.black,
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            ),
                  ]
                ),
                SizedBox(height:15),
                 new Row(
                   mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                  children: <Widget>[
                   Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child :
            //Printing Item on Text Widget 
            Text('CGPA ='+'$ans', 
            style: TextStyle
                (fontSize: 20, 
                color: Colors.black,fontWeight: FontWeight.bold))),
 
                  ]
                ),

              ],
          ),
     ),
    );
  }
}