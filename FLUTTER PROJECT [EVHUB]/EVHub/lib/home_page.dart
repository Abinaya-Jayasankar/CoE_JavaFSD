import 'package:flutter/material.dart';
import 'charging_stations_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for neon effect
      body: Column(
        children: [
          // Image at the top
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4, // 40% of screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
               "https://img.freepik.com/premium-photo/car-charging-station-electric-car_135892-1297.jpg",//"https://as2.ftcdn.net/v2/jpg/05/68/28/41/1000_F_568284117_1w1b2ruB9oRBcBWYR5xzQhZ0xK8a3QKa.jpg", // "https://image.freepik.com/free-vector/electric-car-charging-station-front-view-electric-car-silhouette-with-green-glowing-dark-background-ev-concept_148087-350.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Search area
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Find Nearby EV Charging Stations",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent, // Neon green text
                      shadows: [Shadow(color: Colors.greenAccent, blurRadius: 10)],
                    ),
                  ),
                  SizedBox(height: 20), // Space between text and search bar
                  TextField(
                    controller: _cityController,
                    style: TextStyle(color: Colors.greenAccent), // Neon green text input
                    decoration: InputDecoration(
                      hintText: "Enter City Name",
                      hintStyle: TextStyle(color: Colors.greenAccent.withOpacity(0.6)), // Light neon green hint text
                      filled: true,
                      fillColor: Colors.black, // Black input background
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.greenAccent), // Neon green border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent, width: 2),
                      ),
                    ),
                  ),
                  SizedBox(height: 20), // Space before button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChargingStationsScreen(city: _cityController.text),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // Black button
                      foregroundColor: Colors.greenAccent, // Neon green text
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      shadowColor: Colors.greenAccent,
                      elevation: 10, // Neon glow effect
                      side: BorderSide(color: Colors.greenAccent, width: 2),
                    ),
                    child: Text("Find Stations", style: TextStyle(shadows: [Shadow(color: Colors.greenAccent, blurRadius: 10)])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}