import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'nasa_api_service.dart';

class ApodScreen extends StatefulWidget {
  @override
  _ApodScreenState createState() => _ApodScreenState();
}

class _ApodScreenState extends State<ApodScreen> {
  Map<String, dynamic>? apodData;

  @override
  void initState() {
    super.initState();
    fetchAPOD();
  }

  void fetchAPOD() async {
    try {
      final data = await NasaApiService.fetchAPOD();
      setState(() {
        apodData = data;
      });
    } catch (e) {
      print("Error fetching APOD: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Astronomy Picture of the Day 🌌")),
      body: apodData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CachedNetworkImage(imageUrl: apodData!['url'], height: 300, fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(apodData!['title'], style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(apodData!['explanation']),
                ),
              ],
            ),
    );
  }
}
