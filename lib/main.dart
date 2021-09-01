import 'package:flutter/material.dart';
import './Random_Words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){



     return MaterialApp(
       theme: ThemeData(primaryColor: Colors.deepOrange),
   /*   home: Scaffold(

        appBar: AppBar(
          title: const Text("SID's App"),
        ),
        body: Center(child: Text(pair.asPascalCase , style: TextStyle(
          fontSize: 25,color: Colors.purple
        ),),),
      ), */

       home: RandomWords()


    );


 /*  return MaterialApp(
      home: Text("Hi There",
      style: TextStyle(fontSize: 35,
      color: Colors.amber, backgroundColor: Colors.lightGreenAccent))
    ); */

  }



}

