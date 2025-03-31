import 'package:flutter/material.dart';
import 'api_service.dart';
import 'geocoding_service.dart';
import 'station_card.dart';

class ChargingStationsScreen extends StatefulWidget {
  final String city;
  ChargingStationsScreen({required this.city});

  @override
  _ChargingStationsScreenState createState() => _ChargingStationsScreenState();
}

class _ChargingStationsScreenState extends State<ChargingStationsScreen> {
  List<dynamic> stations = [];
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    super.initState();
    _fetchStations();
  }

  _fetchStations() async {
    setState(() {
      isLoading = true;
      isError = false;
    });

    try {
      final coordinates = await GeocodingService.getCoordinates(widget.city);
      if (coordinates == null) {
        setState(() {
          isError = true;
          isLoading = false;
        });
        return;
      }

      List<dynamic> results = await ApiService.fetchChargingStations(
        coordinates["lat"]!,
        coordinates["lng"]!,
      );

      setState(() {
        stations = results;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isError = true;
        isLoading = false;
      });
      print("Error fetching stations: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EV Stations in ${widget.city}")),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : isError
              ? Center(child: Text("Error loading data. Please try again.", style: TextStyle(color: Colors.red)))
              : stations.isEmpty
                  ? Center(child: Text("No stations found"))
                  : ListView.builder(
                      itemCount: stations.length,
                      itemBuilder: (context, index) {
                        return StationCard(station: stations[index]);
                      },
                    ),
    );
  }
}