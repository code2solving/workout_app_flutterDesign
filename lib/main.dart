import 'package:flutter/material.dart';
import 'package:workouthelper/pages/home.dart';
import 'package:workouthelper/pages/patternPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(right:32,left:32,top:32),
      child:MaterialApp(
          debugShowCheckedModeBanner: false,
          color: Colors.white,
          home: PatternPage(),
          theme: ThemeData(
            fontFamily: 'Inter'
          ),
        ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
