import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  final double lat;
  final double lng;

  const MapPage({super.key, required this.lat, required this.lng});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Keep background black
      appBar: AppBar(
        backgroundColor: Color(0xFF001F00), // Black AppBar
        title: const Text(
          "EV Station Location",
          style: TextStyle(color: Colors.green), // Green title like the screenshot
        ),
        iconTheme: const IconThemeData(color: Colors.white), // White back button
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(lat, lng),
          zoom: 12.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(lat, lng),
                child: const Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
