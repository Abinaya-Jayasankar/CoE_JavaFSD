import 'package:flutter/material.dart';
import 'map_page.dart';

class StationCard extends StatelessWidget {
  final dynamic station;

  StationCard({required this.station});

  @override
  Widget build(BuildContext context) {
    String name = station["AddressInfo"]?["Title"] ?? "Unknown";
    String distance = station["AddressInfo"]?["Distance"]?.toStringAsFixed(2) ?? "N/A";
    String address = station["AddressInfo"]?["AddressLine1"] ?? "Address not available";

    double? lat = station["AddressInfo"]?["Latitude"];
    double? lng = station["AddressInfo"]?["Longitude"];

    return Card(
      color: Colors.black, // Neon effect with black background
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.greenAccent, width: 2), // Neon green border
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.electric_car, color: Colors.greenAccent, size: 30),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.social_distance, color: Colors.greenAccent, size: 20),
                SizedBox(width: 5),
                Text(
                  "Distance: $distance km",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.greenAccent, size: 20),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    address,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyanAccent, // Cyan button
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  if (lat != null && lng != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapPage(lat: lat, lng: lng),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Location data not available")),
                    );
                  }
                },
                child: Text("Locate"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
