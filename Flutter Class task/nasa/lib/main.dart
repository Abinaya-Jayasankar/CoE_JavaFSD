import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(SpaceExplorerApp());
}

class SpaceExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Space Explorer",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
       debugShowCheckedModeBanner: false, 
    );
  }
}
