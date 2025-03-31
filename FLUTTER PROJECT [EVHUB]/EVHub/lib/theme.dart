import 'package:flutter/material.dart';

class AppThemes {

static final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF4169E1), // Royal Blue for vibrance
  scaffoldBackgroundColor: Colors.white, // Clean white background
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF001F3F), // Deep Navy Blue
    elevation: 10, // Adds depth
    shadowColor: Colors.blueAccent.withOpacity(0.7), // Neon blue glow effect
    titleTextStyle: TextStyle(
      color: Colors.lightBlueAccent, // Neon blue text for contrast
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.lightBlueAccent), // Neon effect for icons
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Ensuring readability
    bodyMedium: TextStyle(color: Colors.black87),
  ),
);



 static final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF66FF99) ,// Neon Green (Current), // Neon Gol, // Electric Green for a modern techy feel
  scaffoldBackgroundColor: Color(0xFF000000), // True Matte Black
  appBarTheme: AppBarTheme(
  backgroundColor: Color(0xFF001F00), // Dark green base
  elevation: 10, // Adds depth
  shadowColor: Colors.greenAccent.withOpacity(0.7), // Neon glow effect
  titleTextStyle: TextStyle(
    color: Colors.greenAccent, // Neon text color
    fontSize: 22,
    fontWeight: FontWeight.bold,
  ),
  iconTheme: IconThemeData(color: Colors.greenAccent), // Neon icons
),

  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
);

}
